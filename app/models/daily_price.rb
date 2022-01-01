class DailyPrice < ApplicationRecord

  	belongs_to :ticker
    default_scope { order(name: 'asc') }
  	
	before_save :assign_names

	def assign_names
		ticker = Ticker.find(self.ticker_id)
		self.name = ticker.name		

  	end

end
