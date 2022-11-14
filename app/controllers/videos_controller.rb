class VideosController < ApplicationController
  AS_JSON_VIDEO_ATTRS = %i(id title description video_id like_count view_count)

  before_action :is_authenticated, only: [:destroy]

  def index
    @videos = Video.page(params[:page] || DEFAULT_PAGE).per(params[:per_page] || DEFAULT_PER_PAGE)
                   .order(created_at: :desc)
                   .includes(:user)
    render status: Settings.http_status.ok, json: {
      records: @videos.as_json(
        only: AS_JSON_VIDEO_ATTRS,
        include: {
          user: {
            only: %i(id email)
          }
        }
      )
    }
  end

  def create
    @video = Videos::CreateService.new(params, current_user).execute
    return render json: { records: @video.as_json(only: AS_JSON_VIDEO_ATTRS) }, status: Settings.http_status.ok if @video

    render_bad_request(@video)
  end
end
