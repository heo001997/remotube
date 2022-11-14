class ApplicationController < ActionController::API
  def is_authenticated
    return true if current_user.present?

    render json: { errors: "user is not authenticated" }, status: Settings.http_status.unauthorized
  end

  def current_user
    @current_user ||= User.find_by_access_token(request.headers["Authorization"])
  end

  private

  def render_not_found
    render json: { errors: "Record Not Found" }, status: Settings.http_status.not_found
  end

  def render_bad_request(records)
    render json: { errors: records.errors }, status: Settings.http_status.bad_request
  end
end

