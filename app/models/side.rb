class Side < ApplicationRecord
  has_and_belongs_to_many :food_packs
end
