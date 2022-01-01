json.extract! portfolio, :id, :name, :date, :buy_qty, :comp_qty, :att_qty, :buy_unit_cost, :comp_unit_cost, :att_unit_cost, :buy_cost_amt, :comp_cost_amt, :att_cost_amt, :last_sell_price, :target_sell_price, :buy_method, :sell_method, :ticker_id, :created_at, :updated_at
json.url portfolio_url(portfolio, format: :json)
