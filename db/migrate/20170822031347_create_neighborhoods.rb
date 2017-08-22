class CreateNeighborhoods < ActiveRecord::Migration[5.0]
  def change
    create_table :neighborhoods do |t|
      t.string :neighborhood_name

      t.timestamps

    end
  end
end
