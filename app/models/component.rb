class Component < ApplicationRecord
  belongs_to :component_validation
  has_many :pc_buildings
end
