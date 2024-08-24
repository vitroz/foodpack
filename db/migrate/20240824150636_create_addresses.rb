class CreateAddresses < ActiveRecord::Migration[7.2]
  def change
    create_table :addresses do |t|
      t.references :client, null: false, foreign_key: true
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :location_number

      t.timestamps
    end
  end
end
