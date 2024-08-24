json.extract! address, :id, :client_id, :street, :city, :state, :postal_code, :location_number, :created_at, :updated_at
json.url address_url(address, format: :json)
