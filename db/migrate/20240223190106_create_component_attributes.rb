class CreateComponentAttributes < ActiveRecord::Migration[7.1]
  def change
    create_table :component_attributes do |t|
      t.string :componentType
      t.string :brand
      t.string :cpuSupport
      t.integer :memorySlot
      t.integer :memoryLimit
      t.boolean :video
      t.boolean :isGPU
      t.integer :memory
      t.timestamps
    end
  end
end
