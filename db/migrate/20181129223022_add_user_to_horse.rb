class AddUserToHorse < ActiveRecord::Migration[5.2]
  def change
    add_reference :horses, :user, foreign_key: true
  end
end
