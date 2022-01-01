class Ticker < ApplicationRecord

	has_one :stock, dependent: :destroy
	has_one :consensu, dependent: :destroy
	has_one :portfolio, dependent: :destroy
	has_one :daily_price, dependent: :destroy

	default_scope { order('name ASC')}


end
