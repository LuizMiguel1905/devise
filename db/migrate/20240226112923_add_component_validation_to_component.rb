class AddComponentValidationToComponent < ActiveRecord::Migration[7.1]
  def change
    add_reference :components, :component_validation, null: false, foreign_key: true
  end
end
