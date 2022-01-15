require 'csv'

class CrtStocks < ActiveRecord::Base
	records_ins = 0
    records_upd = 0
  	CSV.foreach(Rails.root.join("db/stocks.csv"), col_sep: ',', headers: true) do |row|
        tickers = Ticker.where(name: row[0])
        ticker = tickers.first
        if ticker
            stocks = Stock.where(name: row[0])
            stock = stocks.first
            if stock
            stock.market = row[1]
            stock.price = row[2] 
            stock.max_price = row[3]
            stock.min_price = row[4] 
            stock.pe = row[5]
            stock.pbv = row[6]
            stock.paid_up = row[7] 
            stock.market_cap = row[8] 
            stock.daily_volume = row[9]          
            stock.beta = row[10]
            stock.save
            records_upd += 1                          
            else
      		Stock.find_or_create_by(
              name: row[0], 
              market: row[1],
              price: row[2], 
          	  max_price: row[3],
              min_price: row[4], 
              pe: row[5],
              pbv: row[6],
              paid_up: row[7], 
              market_cap: row[8], 
              daily_volume: row[9],
              beta: row[10],
              ticker_id: ticker.id)	
          	  records_ins += 1
              printf "%10s \n", row[0]
  		    end
        end
    end
  	printf "%3d records added, %3d records updated.", records_ins, records_upd
end