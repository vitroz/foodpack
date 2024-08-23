class CreateFoodsSidesJoinTable < ActiveRecord::Migration[7.2]
  def change
    create_join_table :foods, :sides do |t|
      t.index [:food_id, :side_id]
      t.index [:side_id, :food_id]
    end
  end
end
