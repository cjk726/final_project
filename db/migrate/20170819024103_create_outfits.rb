class CreateOutfits < ActiveRecord::Migration[5.0]
  def change
    create_table :outfits do |t|
      t.integer :user_id
      t.integer :comfort_zone_id

      t.timestamps

    end
  end
end
