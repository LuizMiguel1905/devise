class Computer < ApplicationRecord
  has_and_belongs_to_many :components, join_table: 'computers_components'

end
