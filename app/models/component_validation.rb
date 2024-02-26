class ComponentValidation < ApplicationRecord
  belongs_to :component_attribute
  has_many :components
end
