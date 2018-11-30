class AddImageUrlToHorses < ActiveRecord::Migration[5.2]
  def change
    add_column :horses, :image_url, :string
  end
end
