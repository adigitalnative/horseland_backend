class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :player, foreign_key: true
      t.monetize :amount
      t.string :description

      t.timestamps
    end
  end
end
