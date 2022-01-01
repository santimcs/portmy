class Consensu < ApplicationRecord
  belongs_to :ticker

  def bhs
  	[buy.to_s,hold.to_s,sell.to_s].join('-')
  end
  
end
