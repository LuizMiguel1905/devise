class CreatePcBuildings < ActiveRecord::Migration[7.1]
  def change
    create_table :pc_buildings do |t|

      t.string :clientName
      t.timestamps
    end
  end
end
