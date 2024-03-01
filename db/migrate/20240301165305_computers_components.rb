class ComputersComponents < ActiveRecord::Migration[7.1]
  def change
    create_table :computers_components, id: false do |t|
      t.belongs_to :computer
      t.belongs_to :component
    end
  end
end
