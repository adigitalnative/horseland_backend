class AddSalePriceToHorse < ActiveRecord::Migration[5.2]
  def change
    add_column :horses, :sale_price, :integer, null: false, default: 1000
  end
end
