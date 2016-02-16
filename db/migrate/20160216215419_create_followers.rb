class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :user_id, null: false 
      t.integer :follower_id, null: false
      
      t.timestamps null: false
    end
    add_index :followers, :user_id
    add_index :followers, :follower_id
  end
end
