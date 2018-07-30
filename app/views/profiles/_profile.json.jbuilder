json.extract! profile, :id, :nickname, :gender, :birthday, :introduction,:user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
