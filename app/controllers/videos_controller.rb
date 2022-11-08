class VideosController < ApplicationController
  before_action :set_video, only: [:show, :update, :destroy]

  def show
    render json: {
      status: Settings.http_status.ok,
      records: @video
    }
  end

  def index
    @videos = Video.page(1).per(10)
    render json: {
      status: Settings.http_status.ok,
      records: @videos
    }
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      render json: {
        status: Settings.http_status.ok,
        records: @video
      }
    else
      render json: {
        status: Settings.http_status.bad_request,
        errors: @video.errors
      }
    end
  end

  def update
    if @video.update(video_params)
      render json: @video
    else
      render json: {
        status: Settings.http_status.bad_request,
        errors: @video.errors
      }
    end
  end

  def destroy
    if @video.destroy
      render json: { status: Settings.http_status.no_content }
    end
  end

  private

    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:id, :title, :description, :video_url)
    end
end
