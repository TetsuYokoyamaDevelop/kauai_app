json.extract! micropost, :id, :text, :tag, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
