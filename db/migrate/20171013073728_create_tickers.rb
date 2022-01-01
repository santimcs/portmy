class CreateTickers < ActiveRecord::Migration[5.1]
  def change
    create_table :tickers do |t|
      t.string :name
      t.string :full_name
      t.string :sector
      t.string :subsector
      t.string :market
      t.string :website

      t.timestamps
    end
    add_index :tickers, [:name], unique: true
  end
end
