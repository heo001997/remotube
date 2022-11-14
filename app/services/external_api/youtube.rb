class ExternalApi::Youtube
  def self.find_by_video_id(video_id)
    params_video_id = "?id=#{video_id}"
    params_api_key = "&key=#{Rails.application.credentials.google[:youtube]}"
    params_data_part = '&part=snippet,statistics'
    url = YOUTUBE_API_URL + params_video_id + params_api_key + params_data_part
    res = Faraday.get(url)
    JSON.parse(res.body, symbolize_names: true)
  end
end
