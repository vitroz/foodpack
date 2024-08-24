class RenameTypeInAddresses < ActiveRecord::Migration[7.2]
  def change
    rename_column :addresses, :type, :address_type
  end
end
