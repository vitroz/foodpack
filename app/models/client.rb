class Client < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true

  has_many :addresses
end
