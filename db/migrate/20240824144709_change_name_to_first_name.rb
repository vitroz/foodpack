class ChangeNameToFirstName < ActiveRecord::Migration[7.2]
  def change
    rename_column :clients, :name, :first_name
  end
end
