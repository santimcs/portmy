class Portfolio < ApplicationRecord
  	belongs_to :ticker
  	enum buy_method: [:min_price, :tenpc_disc, :buy_target]
  	enum sell_method: [:max_price, :consensus, :sell_target]

  	validates :ticker_id, uniqueness: true
#  	validates :buy_unit_cost, :comp_unit_cost, numericality: {greater_than_or_equal_to: 3.0}
#  	validates :buy_qty, :comp_qty, numericality: {greater_than_or_equal_to: 100} 

  	before_save :assign_values

  	private
	def assign_values

		ticker = Ticker.find(self.ticker_id)
		self.name = ticker.name

		self.att_qty = self.buy_qty + self.comp_qty
		self.buy_cost_amt = self.buy_qty * self.buy_unit_cost
		self.comp_cost_amt = self.comp_qty * self.comp_unit_cost		
		self.att_cost_amt = self.buy_cost_amt + self.comp_cost_amt
		self.att_unit_cost = self.att_cost_amt / self.att_qty
      
	end

end
