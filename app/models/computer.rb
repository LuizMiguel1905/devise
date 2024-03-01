class Computer < ApplicationRecord
  has_and_belongs_to_many :components, join_table: 'computers_components'
  validate :verify_ram

  private

  def verify_ram
    components_ids = components.pluck(:id)
    validations = ComponentValidation.where(component_attribute_id: components_ids)

    validations.each do |validation|
      if validation.componentType == 'RAM'
        errors.add(:components, "não pode incluir uma memória RAM")
      end
    end
  end
end
