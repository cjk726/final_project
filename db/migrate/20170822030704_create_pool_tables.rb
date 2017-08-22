class CreatePoolTables < ActiveRecord::Migration[5.0]
  def change
    create_table :pool_tables do |t|
      t.string :pool_table_name
      t.float :price
      t.integer :size
      t.string :pool_table_pic
      t.integer :venue_id

      t.timestamps

    end
  end
end
