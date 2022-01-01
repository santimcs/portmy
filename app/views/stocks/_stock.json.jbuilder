json.extract! stock, :id, :name, :market, :price, :max_price, :min_price, :pe, :pbv, :paid_up, :market_cap, :daily_volume, :beta, :created_at, :updated_at
json.url stock_url(stock, format: :json)
