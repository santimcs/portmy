require 'csv'

class CreateAll < ActiveRecord::Base

    records_ins = 0
    records_upd = 0
    CSV.foreach(Rails.root.join("db/stocks.csv"), col_sep: ',', headers: false) do |row|
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
        #       printf "%10s \n", row[0]                 
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
    printf "Stocks %3d records added, %3d records updated.\n", records_ins, records_upd

    records_ins = 0
    records_upd = 0
    CSV.foreach(Rails.root.join("db/consensus.csv"), col_sep: ',', headers: false) do |row|
        ticker = Ticker.find_by_name(row[0])
        if ticker
            consensus = Consensu.where(name: row[0])
            consensu = consensus.first
            if consensu
                consensu.price = row[1] 
                consensu.buy = row[2]
                consensu.hold = row[3] 
                consensu.sell = row[4] 
                consensu.eps_a = row[5] 
                consensu.eps_b = row[6] 
                consensu.pe = row[7] 
                consensu.pbv = row[8]
                consensu.yield = row[9] 
                consensu.target_price = row[10] 
                consensu.status = row[11] 
                consensu.save
                records_upd += 1   
            else
                Consensu.find_or_create_by(
                name: row[0], 
                price: row[1], 
                buy: row[2],
                hold: row[3], 
                sell: row[4], 
                eps_a: row[5], 
                eps_b: row[6], 
                pe: row[7], 
                pbv: row[8],
                yield: row[9], 
                target_price: row[10], 
                status: row[11],         
                ticker_id: ticker.id)
                records_ins += 1
                printf "%10s \n", row[0]
            end
        end
    end
    printf "Consensus %3d records add, %3d records update.\n", records_ins, records_upd
end