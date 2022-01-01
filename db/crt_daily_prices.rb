require 'csv'

class CreateDailyPrices < ActiveRecord::Base
  records_ins = 0
  records_upd = 0
  # Delete old records before insert new records
  puts "Start of delete process"
  sql = "DELETE FROM daily_prices" 
  results = ActiveRecord::Base.connection.execute(sql)
  results.each do | result |
    printf "%10s", result
  end
  puts "End of delete process"

  CSV.foreach(Rails.root.join("db/daily_prices.csv"), col_sep: '|', headers: false) do |row|
    ticker = Ticker.find_by_name(row[0])
    if ticker
      daily_prices = DailyPrice.where(name: row[0])
      daily_price = daily_prices.first
      if daily_price
        daily_price.date = row[1] 
        daily_price.open_price = row[2]
        daily_price.max_price = row[3] 
        daily_price.min_price = row[4] 
        daily_price.price = row[5] 
        daily_price.qty = row[6] 
        daily_price.save
        records_upd += 1   
      else
        DailyPrice.find_or_create_by(
        name: row[0], 
        date: row[1],        
        open_price: row[2],
        max_price: row[3], 
        min_price: row[4], 
        price: row[5], 
        qty: row[6],        
        ticker_id: ticker.id)
        records_ins += 1
      end
    end
  end
      printf "%3d records add, %3d records update.", records_ins, records_upd
end