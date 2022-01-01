require 'test_helper'

class DailyPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_price = daily_prices(:one)
  end

  test "should get index" do
    get daily_prices_url
    assert_response :success
  end

  test "should get new" do
    get new_daily_price_url
    assert_response :success
  end

  test "should create daily_price" do
    assert_difference('DailyPrice.count') do
      post daily_prices_url, params: { daily_price: { date: @daily_price.date, max_price: @daily_price.max_price, min_price: @daily_price.min_price, name: @daily_price.name, open_price: @daily_price.open_price, price: @daily_price.price, qty: @daily_price.qty, ticker_id: @daily_price.ticker_id } }
    end

    assert_redirected_to daily_price_url(DailyPrice.last)
  end

  test "should show daily_price" do
    get daily_price_url(@daily_price)
    assert_response :success
  end

  test "should get edit" do
    get edit_daily_price_url(@daily_price)
    assert_response :success
  end

  test "should update daily_price" do
    patch daily_price_url(@daily_price), params: { daily_price: { date: @daily_price.date, max_price: @daily_price.max_price, min_price: @daily_price.min_price, name: @daily_price.name, open_price: @daily_price.open_price, price: @daily_price.price, qty: @daily_price.qty, ticker_id: @daily_price.ticker_id } }
    assert_redirected_to daily_price_url(@daily_price)
  end

  test "should destroy daily_price" do
    assert_difference('DailyPrice.count', -1) do
      delete daily_price_url(@daily_price)
    end

    assert_redirected_to daily_prices_url
  end
end
