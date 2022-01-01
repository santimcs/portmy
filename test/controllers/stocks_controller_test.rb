require 'test_helper'

class StocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stock = stocks(:one)
  end

  test "should get index" do
    get stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_stock_url
    assert_response :success
  end

  test "should create stock" do
    assert_difference('Stock.count') do
      post stocks_url, params: { stock: { beta: @stock.beta, daily_volume: @stock.daily_volume, market: @stock.market, market_cap: @stock.market_cap, max_price: @stock.max_price, min_price: @stock.min_price, name: @stock.name, paid_up: @stock.paid_up, pbv: @stock.pbv, pe: @stock.pe, price: @stock.price } }
    end

    assert_redirected_to stock_url(Stock.last)
  end

  test "should show stock" do
    get stock_url(@stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_stock_url(@stock)
    assert_response :success
  end

  test "should update stock" do
    patch stock_url(@stock), params: { stock: { beta: @stock.beta, daily_volume: @stock.daily_volume, market: @stock.market, market_cap: @stock.market_cap, max_price: @stock.max_price, min_price: @stock.min_price, name: @stock.name, paid_up: @stock.paid_up, pbv: @stock.pbv, pe: @stock.pe, price: @stock.price } }
    assert_redirected_to stock_url(@stock)
  end

  test "should destroy stock" do
    assert_difference('Stock.count', -1) do
      delete stock_url(@stock)
    end

    assert_redirected_to stocks_url
  end
end
