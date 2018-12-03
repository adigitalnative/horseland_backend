class AddDescriptionToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :description, :text
  end
end
