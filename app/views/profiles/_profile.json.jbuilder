json.extract! profile, :id, :name, :gender, :birthday, :phone, :location, :bio, :created_at, :updated_at
json.url profile_url(profile, format: :json)
