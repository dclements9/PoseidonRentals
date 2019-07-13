class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :category
      t.boolean :available
      t.decimal :cost

      t.timestamps
    end
  end
end
