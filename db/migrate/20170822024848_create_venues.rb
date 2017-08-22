class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :venue_name
      t.string :address
      t.integer :neighborhood_id
      t.string :ambience
      t.integer :pool_table_id

      t.timestamps

    end
  end
end
