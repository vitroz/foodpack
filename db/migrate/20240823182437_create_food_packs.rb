class CreateFoodPacks < ActiveRecord::Migration[7.2]
  def change
    create_table :food_packs do |t|
      t.string :name
      t.references :protein, null: false, foreign_key: true

      t.timestamps
    end
  end
end
