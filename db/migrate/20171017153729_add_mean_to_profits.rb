class AddMeanToProfits < ActiveRecord::Migration[5.1]
  def change
    add_column :profits, :mean_pct, :decimal
    add_column :profits, :std_pct, :decimal
  end
end
