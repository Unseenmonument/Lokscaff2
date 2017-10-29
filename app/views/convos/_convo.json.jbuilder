json.extract! convo, :id, :user_id, :rume_id, :title, :description, :likes, :url, :convo_id, :created_at, :updated_at
json.url convo_url(convo, format: :json)
