json.extract! feed, :id, :user_id, :network_id, :subscription_id, :created_at, :updated_at
json.url feed_url(feed, format: :json)