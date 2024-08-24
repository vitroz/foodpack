class CreateClients < ActiveRecord::Migration[7.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.date :birthday
      t.string :social_media

      t.timestamps
    end
  end
end
