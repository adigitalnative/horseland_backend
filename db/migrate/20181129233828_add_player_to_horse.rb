class AddPlayerToHorse < ActiveRecord::Migration[5.2]
  def change
    add_reference :horses, :player, foreign_key: true
  end
end
