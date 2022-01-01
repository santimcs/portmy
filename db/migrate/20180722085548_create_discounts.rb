class CreateDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :discounts do |t|
      t.decimal :rate, precision: 4, scale: 4

      t.timestamps
    end
  end
end
