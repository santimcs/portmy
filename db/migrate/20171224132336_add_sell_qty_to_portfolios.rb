class AddSellQtyToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :sell_qty, :int
  end
end
