class FoodPack < ApplicationRecord
  belongs_to :protein
  has_and_belongs_to_many :sides
end
