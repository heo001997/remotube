class AddConstraintToUsersAndVideos < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :email, false
    change_column_null :users, :password_hash, false
    change_column_null :users, :password_salt, false

    change_column_null :videos, :title, false
  end
end
