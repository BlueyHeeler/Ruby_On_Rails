json.extract! movie, :id, :name, :release_date, :rating, :description, :user_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)
