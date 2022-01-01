class CreateConsensus < ActiveRecord::Migration[5.1]
  def change
    create_table :consensus do |t|
      t.string :name
      t.decimal :price, precision: 6, scale: 2
      t.integer :buy
      t.integer :hold
      t.integer :sell
      t.decimal :eps_a
      t.decimal :eps_b
      t.decimal :pe
      t.decimal :pbv
      t.decimal :yield
      t.decimal :target_price, precision: 6, scale: 2
      t.string :status
      t.belongs_to :ticker, foreign_key: true

    end
    add_index :consensus, [:name], unique: true    
  end
end
