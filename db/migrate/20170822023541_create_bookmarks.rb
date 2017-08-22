class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.integer :venue_id
      t.integer :pool_table_id
      t.integer :user_id
      t.text :comments

      t.timestamps

    end
  end
end
