class AddLastNameToClients < ActiveRecord::Migration[7.2]
  def change
    add_column :clients, :last_name, :string
  end
end
