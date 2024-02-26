class AddComponentToPcBuilding < ActiveRecord::Migration[7.1]
  def change
    add_reference :pc_buildings, :component, null: false, foreign_key: true

  end
end
