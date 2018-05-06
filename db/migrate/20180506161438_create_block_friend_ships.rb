class CreateBlockFriendShips < ActiveRecord::Migration[5.0]
  def change
    create_table :block_friend_ships do |t|
      t.integer :user_id
      t.integer :block_id

      t.timestamps
    end
  end
end
