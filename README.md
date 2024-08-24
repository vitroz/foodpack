# README

## To install dependencies run

docker-compose run web bundle install

## To run commands
docker-compose run web bundle exec rails <command>

docker-compose run web bundle exec rails console

docker-compose run web bundle exec rails db:create

docker-compose run web bundle exec rails db:migrate

docker-compose run web bundle exec rails generate migration AddLastNameToClients last_name:string

docker-compose run web bundle exec rails generate scaffold Client name:string birthday:date social_media:string

docker-compose run web bundle exec rails generate scaffold Address client:references street:string city:string state:string postal_code:string location_number:string

docker-compose run web bundle exec rails generate migration AddTypeAndNeighborhoodToAddresses

# Client model with required fields
rails generate scaffold Client name:string birthday:date social_media:string

# Address model, belongs to a Client
rails generate scaffold Address client:references street:string city:string state:string postal_code:string

# Order model, belongs to a Client
rails generate scaffold Order client:references status:string delivered_at:datetime completed_at:datetime

# FoodPack model, belongs to an Order
rails generate scaffold FoodPack order:references

# FoodItem model with associations to Protein and Side
rails generate scaffold FoodItem name:string protein_id:integer:index side_id:integer:index

# Join table for FoodPack and FoodItem with quantity_in_grams
rails generate migration CreateFoodPacksFoodItems food_pack:references food_item:references quantity_in_grams:integer

# Protein model with unique, uppercase name
rails generate scaffold Protein name:string:uniq

# Side model with unique, uppercase name
rails generate scaffold Side name:string:uniq

validate :protein_or_side_presence

private

def protein_or_side_presence
  if protein_id.present? && side_id.present?
    errors.add(:base, "Food item can only be either a protein or a side, not both.")
  elsif protein_id.blank? && side_id.blank?
    errors.add(:base, "Food item must be either a protein or a side.")
  end
end

before_save { name.upcase! }

# Migration to add constraints
class AddConstraintsToFoodItems < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :food_items, :proteins, column: :protein_id
    add_foreign_key :food_items, :sides, column: :side_id

    add_check_constraint :food_items, "(protein_id IS NULL OR side_id IS NULL)", name: "protein_or_side_check"
  end
end
