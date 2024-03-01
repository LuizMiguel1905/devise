class CreateComputers < ActiveRecord::Migration[7.1]
  def change
    create_table :computers do |t|
      t.string :clientName
      t.integer :qntOfSlot
      t.timestamps
    end
  end
end
