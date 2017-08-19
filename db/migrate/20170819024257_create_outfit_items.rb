class CreateOutfitItems < ActiveRecord::Migration[5.0]
  def change
    create_table :outfit_items do |t|
      t.integer :outfit_id
      t.integer :clothing_item_id

      t.timestamps

    end
  end
end
