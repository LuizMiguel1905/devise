class CreateComputers < ActiveRecord::Migration[7.1]
  def change
    create_table :computers do |t|
      t.string :clientName
      t.string :component1
      t.string :component2
      t.string :component3
      t.string :component4
      t.integer :qntOfSlot
      t.timestamps
    end
  end
end
