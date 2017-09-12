class AddColumnsToFeed < ActiveRecord::Migration
  def change
  	add_column :feeds , :post, :string
  	add_column :feeds , :user_id ,:integer

    

  end
end
