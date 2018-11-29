class CreateHorses < ActiveRecord::Migration[5.2]
  def change
    create_table :horses do |t|
      t.string :name, null: false, default: "untitled"
      t.references :breed, foreign_key: true
      t.string :color
      t.integer :age, null: false, default: 0

      t.timestamps
    end
  end
end
