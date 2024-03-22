json.extract! like, :id, :user_id, :liked_by_id, :created_at, :updated_at
json.url like_url(like, format: :json)
