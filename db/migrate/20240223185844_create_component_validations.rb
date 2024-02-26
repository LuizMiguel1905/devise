class CreateComponentValidations < ActiveRecord::Migration[7.1]
  def change
    create_table :component_validations do |t|
      t.string :componentType

      t.timestamps
    end
  end
end
