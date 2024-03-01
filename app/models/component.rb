class Component < ApplicationRecord
  has_and_belongs_to_many :computers, join_table: 'computers_components'
  belongs_to :component_validation

end
