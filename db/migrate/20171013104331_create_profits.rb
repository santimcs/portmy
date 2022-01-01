class CreateProfits < ActiveRecord::Migration[5.1]
  def change
    create_table :profits do |t|
      t.string :name
      t.integer :year
      t.integer :quarter
      t.integer :kind
      t.integer :latest_amt_y
      t.integer :previous_amt_y
      t.integer :inc_amt_y
      t.decimal :inc_pct_y
      t.integer :latest_amt_q
      t.integer :previous_amt_q
      t.integer :inc_amt_q
      t.decimal :inc_pct_q
      t.integer :q_amt_c
      t.integer :y_amt
      t.integer :inc_amt_py
      t.decimal :inc_pct_py
      t.integer :q_amt_p
      t.integer :inc_amt_pq
      t.decimal :inc_pct_pq
      t.belongs_to :ticker, foreign_key: true

    end
    add_index :profits, [:name, :year, :quarter], unique: true 
  end
end
