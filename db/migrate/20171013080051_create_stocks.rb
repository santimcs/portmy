class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :market
      t.decimal :price, precision: 6, scale: 2
      t.decimal :max_price, precision: 6, scale: 2
      t.decimal :min_price, precision: 6, scale: 2
      t.decimal :pe
      t.decimal :pbv
      t.decimal :paid_up
      t.decimal :market_cap
      t.decimal :daily_volume
      t.decimal :beta
      t.belongs_to :ticker, foreign_key: true

      t.timestamps
    end
    add_index :stocks, [:name], unique: true
  end
end
