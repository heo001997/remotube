class AddLikeCountViewCountVideoIdToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :like_count, :integer, default: 0, null: false
    add_column :videos, :view_count, :integer, default: 0, null: false
    add_column :videos, :video_id, :string, null: false
  end
end
