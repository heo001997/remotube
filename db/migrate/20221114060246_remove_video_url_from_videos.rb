class RemoveVideoUrlFromVideos < ActiveRecord::Migration[6.1]
  def change
    remove_column :videos, :video_url
  end
end
