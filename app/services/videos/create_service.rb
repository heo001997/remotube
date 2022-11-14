class Videos::CreateService
  def initialize(params, current_user)
    @params = params
    @current_user = current_user
    @video = Video.new
  end

  def execute
    @video.video_id = video_url_to_video_id
    return false unless @video.video_id

    @video.assign_attributes(youtube_video_attrs)
    @video.user_id = @current_user.id
    return false unless @video.save
    @video
  end

  private

  def video_url_to_video_id
    video_url = @params[:video_url]
    video_id_matches = REGEX_YOUTUBE_VIDEO_ID.match(video_url)
    return unless video_id_matches

    video_id_matches[0][2..]
  end

  def youtube_video_attrs
    video_response = ExternalApi::Youtube.find_by_video_id(@video.video_id)
    youtube_video = video_response[:items][0]

    {
      title: youtube_video[:snippet][:title],
      description: youtube_video[:snippet][:description],
      like_count: youtube_video[:statistics][:likeCount],
      view_count: youtube_video[:statistics][:viewCount]
    }
  end
end
