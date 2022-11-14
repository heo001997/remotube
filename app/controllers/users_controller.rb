class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def create
    @user = User.find_by_email(params[:email])
    if @user
      is_success = User.authenticate(params[:email], params[:password])
      grant_user_access if is_success
      return serialize_response(is_success)
    end

    @user = User.new(user_params)
    is_success = @user.save
    grant_user_access if is_success
    serialize_response(is_success)
  end

  def me
    @user = User.find_by_access_token(request.headers["Authorization"])
    serialize_response(@user)
  end

  def logout
    @user = User.find_by_access_token(request.headers["Authorization"])
    revoke_user_access if @user
    serialize_response(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:id, :email, :password)
  end

  # No time for refresh_token and expired_time :( sorry
  def grant_user_access
    @user.grant_user_access
  end

  def revoke_user_access
    @user.grant_user_access
  end

  def serialize_response(is_success)
    return render json: failed_response, status: Settings.http_status.bad_request unless is_success

    render json: { records: @user.as_json(only: %i(id email access_token)) },
           status: Settings.http_status.ok
  end

  def failed_response
    errors = @user&.errors.present? ? @user.errors : "invalid combination of email and password"
    {
      errors: errors
    }
  end
end
