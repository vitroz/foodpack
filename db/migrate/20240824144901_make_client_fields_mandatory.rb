class MakeClientFieldsMandatory < ActiveRecord::Migration[7.2]
  def change
    change_column_null :clients, :first_name, false
    change_column_null :clients, :last_name, false
    change_column_null :clients, :birthday, false
  end
end
