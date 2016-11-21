json.extract! content, :id, :user_id, :body, :post_id, :presenter_id, :friendship_id, :created_at, :updated_at
json.url content_url(content, format: :json)