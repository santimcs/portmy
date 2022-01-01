class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.date :date
      t.integer :buy_qty
      t.integer :comp_qty
      t.integer :att_qty
      t.decimal :buy_unit_cost, precision: 6, scale: 2
      t.decimal :comp_unit_cost, precision: 6, scale: 2
      t.decimal :att_unit_cost, precision: 6, scale: 2
      t.decimal :buy_cost_amt
      t.decimal :comp_cost_amt
      t.decimal :att_cost_amt
      t.decimal :last_sell_price, precision: 6, scale: 2
      t.decimal :target_sell_price, precision: 6, scale: 2
      t.integer :buy_method
      t.integer :sell_method
      t.belongs_to :ticker, foreign_key: true

      t.timestamps
    end
    add_index :portfolios, [:name], unique: true
  end
end
