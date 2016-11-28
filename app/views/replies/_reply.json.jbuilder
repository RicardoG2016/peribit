json.extract! reply, :id, :body, :user_id, :post_id, :created_at, :updated_at
json.url reply_url(reply, format: :json)