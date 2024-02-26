json.extract! child, :id, :name, :description, :user_id, :birthdate, :gender, :profile, :created_at, :updated_at
json.url child_url(child, format: :json)
