class AddColumnInUser < ActiveRecord::Migration
  def change
  	add_column :users , :last_name, :string
  	add_column :users , :dob, :string
    
  end
end
