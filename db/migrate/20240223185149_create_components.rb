class CreateComponents < ActiveRecord::Migration[7.1]
  def change
    create_table :components do |t|
      t.string :componentName
      t.references :component_attribute, foreign_key: true
      t.timestamps
    end
  end
end
