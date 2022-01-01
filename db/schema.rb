# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180722085548) do

  create_table "consensus", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 6, scale: 2
    t.integer "buy"
    t.integer "hold"
    t.integer "sell"
    t.decimal "eps_a"
    t.decimal "eps_b"
    t.decimal "pe"
    t.decimal "pbv"
    t.decimal "yield"
    t.decimal "target_price", precision: 6, scale: 2
    t.string "status"
    t.integer "ticker_id"
    t.index ["name"], name: "index_consensus_on_name", unique: true
    t.index ["ticker_id"], name: "index_consensus_on_ticker_id"
  end

  create_table "daily_prices", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.decimal "open_price", precision: 6, scale: 2
    t.decimal "max_price", precision: 6, scale: 2
    t.decimal "min_price", precision: 6, scale: 2
    t.decimal "price", precision: 6, scale: 2
    t.integer "qty"
    t.integer "ticker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "date"], name: "index_daily_prices_on_name_and_date", unique: true
    t.index ["ticker_id"], name: "index_daily_prices_on_ticker_id"
  end

  create_table "discounts", force: :cascade do |t|
    t.decimal "rate", precision: 4, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.integer "buy_qty"
    t.integer "comp_qty"
    t.integer "att_qty"
    t.decimal "buy_unit_cost", precision: 6, scale: 2
    t.decimal "comp_unit_cost", precision: 6, scale: 2
    t.decimal "att_unit_cost", precision: 6, scale: 2
    t.decimal "buy_cost_amt"
    t.decimal "comp_cost_amt"
    t.decimal "att_cost_amt"
    t.decimal "last_sell_price", precision: 6, scale: 2
    t.decimal "target_sell_price", precision: 6, scale: 2
    t.integer "buy_method"
    t.integer "sell_method"
    t.integer "ticker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sell_qty"
    t.index ["name"], name: "index_portfolios_on_name", unique: true
    t.index ["ticker_id"], name: "index_portfolios_on_ticker_id"
  end

  create_table "profits", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.integer "quarter"
    t.integer "kind"
    t.integer "latest_amt_y"
    t.integer "previous_amt_y"
    t.integer "inc_amt_y"
    t.decimal "inc_pct_y"
    t.integer "latest_amt_q"
    t.integer "previous_amt_q"
    t.integer "inc_amt_q"
    t.decimal "inc_pct_q"
    t.integer "q_amt_c"
    t.integer "y_amt"
    t.integer "inc_amt_py"
    t.decimal "inc_pct_py"
    t.integer "q_amt_p"
    t.integer "inc_amt_pq"
    t.decimal "inc_pct_pq"
    t.integer "ticker_id"
    t.decimal "mean_pct"
    t.decimal "std_pct"
    t.index ["name", "year", "quarter"], name: "index_profits_on_name_and_year_and_quarter", unique: true
    t.index ["ticker_id"], name: "index_profits_on_ticker_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.string "market"
    t.decimal "price", precision: 6, scale: 2
    t.decimal "max_price", precision: 6, scale: 2
    t.decimal "min_price", precision: 6, scale: 2
    t.decimal "pe"
    t.decimal "pbv"
    t.decimal "paid_up"
    t.decimal "market_cap"
    t.decimal "daily_volume"
    t.decimal "beta"
    t.integer "ticker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_stocks_on_name", unique: true
    t.index ["ticker_id"], name: "index_stocks_on_ticker_id"
  end

  create_table "tickers", force: :cascade do |t|
    t.string "name"
    t.string "full_name"
    t.string "sector"
    t.string "subsector"
    t.string "market"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tickers_on_name", unique: true
  end

end
