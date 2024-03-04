class Component < ApplicationRecord
  belongs_to :component_attribute
  has_and_belongs_to_many :computers, join_table: 'computers_components'

end
