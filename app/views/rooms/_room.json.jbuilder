json.extract! room, :id, :name, :description, :listeners, :guidelines, :created_at, :updated_at
json.url room_url(room, format: :json)
