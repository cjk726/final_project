class CreateClothingItems < ActiveRecord::Migration[5.0]
  def change
    create_table :clothing_items do |t|
      t.string :item_name

      t.timestamps

    end
  end
end
