class AddWithdrawalToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :withdrawal, :boolean, null: false, default: false
  end
end
