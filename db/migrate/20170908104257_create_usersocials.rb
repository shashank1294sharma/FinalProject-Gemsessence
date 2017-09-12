class CreateUsersocials < ActiveRecord::Migration
  def change
    create_table :usersocials do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :picture

      t.timestamps null: false
    end
  end
end
