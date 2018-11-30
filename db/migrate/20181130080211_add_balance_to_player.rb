class AddBalanceToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_monetize :players, :balance
  end
end
