json.extract! daily_price, :id, :name, :date, :open_price, :max_price, :min_price, :price, :qty, :ticker_id, :created_at, :updated_at
json.url daily_price_url(daily_price, format: :json)
