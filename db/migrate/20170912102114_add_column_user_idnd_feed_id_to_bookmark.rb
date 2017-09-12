class AddColumnUserIdndFeedIdToBookmark < ActiveRecord::Migration
  def change
  	add_column :bookmarks,:user_id,:integer
  	add_column :bookmarks,:feed_id,:integer
  end
end
