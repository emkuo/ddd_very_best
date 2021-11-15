json.extract! favorited_dish, :id, :name, :cuisine, :venues_id, :user_id, :created_at, :updated_at
json.url favorited_dish_url(favorited_dish, format: :json)
