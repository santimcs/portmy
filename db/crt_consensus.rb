require 'csv'

class CreateConsensus < ActiveRecord::Base
  records_ins = 0
  records_upd = 0
  CSV.foreach(Rails.root.join("db/consensus.csv"), col_sep: '|', headers: true) do |row|
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
      end
    end
  end
      printf "%3d records add, %3d records update.", records_ins, records_upd
end