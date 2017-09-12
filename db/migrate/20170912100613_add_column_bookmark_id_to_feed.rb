class AddColumnBookmarkIdToFeed < ActiveRecord::Migration
  def change
  	add_column :feeds , :bookmark_id , :integer
  end
end
