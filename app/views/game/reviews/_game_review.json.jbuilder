json.extract! game_review, :id, :fun, :playability, :difficulty, :created_at, :updated_at
json.url game_review_url(game_review, format: :json)