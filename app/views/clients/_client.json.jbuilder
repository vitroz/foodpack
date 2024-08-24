json.extract! client, :id, :name, :birthday, :social_media, :created_at, :updated_at
json.url client_url(client, format: :json)
