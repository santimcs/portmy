json.extract! ticker, :id, :name, :full_name, :sector, :subsector, :market, :website, :created_at, :updated_at
json.url ticker_url(ticker, format: :json)
