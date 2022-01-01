class CreateDailyPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_prices do |t|
      t.string :name
      t.date :date
      t.decimal :open_price, precision: 6, scale: 2
      t.decimal :max_price, precision: 6, scale: 2
      t.decimal :min_price, precision: 6, scale: 2
      t.decimal :price, precision: 6, scale: 2
      t.integer :qty
      t.belongs_to :ticker, foreign_key: true

      t.timestamps
    end
    add_index :daily_prices, [:name, :date], unique: true 

  end
end
