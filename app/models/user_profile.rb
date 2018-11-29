class UserProfile < ApplicationRecord

  validates :name, presence: true
end
