class Player < ApplicationRecord

  has_many :horses
  validates :email, presence: true


  def available_horses
    Horse.where("for_sale = true AND player_id != #{self.id}")
  end
end
