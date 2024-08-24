class AddTypeAndNeighborhoodAndMakingFieldsMandatoryToAddresses < ActiveRecord::Migration[7.2]
  def change
    # Add the columns without null constraints first
    add_column :addresses, :type, :string
    add_column :addresses, :neighborhood, :string

    # Populate the new columns with default values
    Address.reset_column_information
    Address.update_all(type: "default_type", neighborhood: "default_neighborhood")

    # Then, add the null constraints
    change_column_null :addresses, :type, false
    change_column_null :addresses, :neighborhood, false
    change_column_null :addresses, :street, false
    change_column_null :addresses, :city, false
    change_column_null :addresses, :state, false
    change_column_null :addresses, :postal_code, false
  end
end
