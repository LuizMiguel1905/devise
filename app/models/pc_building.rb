class PcBuilding < ApplicationRecord
  belongs_to :component

  belongs_to :component_1, class_name: 'Component', foreign_key: 'component_id_1'
  belongs_to :component_2, class_name: 'Component', foreign_key: 'component_id_2'
  belongs_to :component_3, class_name: 'Component', foreign_key: 'component_id_3'
  belongs_to :component_4, class_name: 'Component', foreign_key: 'component_id_4'

  private
    def validateRAM

    end
end
