class CreateComponents < ActiveRecord::Migration[7.1]
  def change
    create_table :components do |t|
      t.string :componentName

      t.timestamps
    end
  end
end
