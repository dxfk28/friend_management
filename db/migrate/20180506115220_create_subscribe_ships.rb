class CreateSubscribeShips < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribe_ships do |t|
      t.integer :user_id
      t.integer :subscribe_id

      t.timestamps
    end
  end
end
