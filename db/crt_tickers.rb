require 'csv'
class CrtTickers < ActiveRecord::Base
	records_ins = 0
	records_upd = 0
	CSV.foreach(Rails.root.join("db/tickers.csv"), { col_sep: '|', headers: true}) do |row|
		tickers = Ticker.where(name: row[0])
		ticker = tickers.first
		if ticker
			ticker.full_name = row[1]
			ticker.sector = row[2]
			ticker.subsector = row[3]
			ticker.market = row[4]
			ticker.website = row[5]
			ticker.save
			records_upd += 1
		else
			Ticker.find_or_create_by(
			name: row[0],
			full_name: row[1],
			sector: row[2],
			subsector: row[3],
			market: row[4],
			website: row[5])
			records_ins += 1
			printf "%10s \n", row[0]
		end
	end
	printf "%2d records added, %2d records updated.", records_ins, records_upd
end