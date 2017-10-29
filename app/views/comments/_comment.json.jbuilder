json.extract! comment, :id, :text, :user_id, :rume_id, :convo_id, :comment_id, :likes, :dislikes, :created_at, :updated_at
json.url comment_url(comment, format: :json)
