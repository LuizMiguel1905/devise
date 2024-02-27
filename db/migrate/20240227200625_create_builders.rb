class CreateBuilders < ActiveRecord::Migration[7.1]
  def change
    create_table :builders do |t|
      t.string :clientName

      t.timestamps
    end
  end
end
