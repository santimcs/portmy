require 'test_helper'

class PortfoliosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @portfolio = portfolios(:one)
  end

  test "should get index" do
    get portfolios_url
    assert_response :success
  end

  test "should get new" do
    get new_portfolio_url
    assert_response :success
  end

  test "should create portfolio" do
    assert_difference('Portfolio.count') do
      post portfolios_url, params: { portfolio: { att_cost_amt: @portfolio.att_cost_amt, att_qty: @portfolio.att_qty, att_unit_cost: @portfolio.att_unit_cost, buy_cost_amt: @portfolio.buy_cost_amt, buy_method: @portfolio.buy_method, buy_qty: @portfolio.buy_qty, buy_unit_cost: @portfolio.buy_unit_cost, comp_cost_amt: @portfolio.comp_cost_amt, comp_qty: @portfolio.comp_qty, comp_unit_cost: @portfolio.comp_unit_cost, date: @portfolio.date, last_sell_price: @portfolio.last_sell_price, name: @portfolio.name, sell_method: @portfolio.sell_method, target_sell_price: @portfolio.target_sell_price, ticker_id: @portfolio.ticker_id } }
    end

    assert_redirected_to portfolio_url(Portfolio.last)
  end

  test "should show portfolio" do
    get portfolio_url(@portfolio)
    assert_response :success
  end

  test "should get edit" do
    get edit_portfolio_url(@portfolio)
    assert_response :success
  end

  test "should update portfolio" do
    patch portfolio_url(@portfolio), params: { portfolio: { att_cost_amt: @portfolio.att_cost_amt, att_qty: @portfolio.att_qty, att_unit_cost: @portfolio.att_unit_cost, buy_cost_amt: @portfolio.buy_cost_amt, buy_method: @portfolio.buy_method, buy_qty: @portfolio.buy_qty, buy_unit_cost: @portfolio.buy_unit_cost, comp_cost_amt: @portfolio.comp_cost_amt, comp_qty: @portfolio.comp_qty, comp_unit_cost: @portfolio.comp_unit_cost, date: @portfolio.date, last_sell_price: @portfolio.last_sell_price, name: @portfolio.name, sell_method: @portfolio.sell_method, target_sell_price: @portfolio.target_sell_price, ticker_id: @portfolio.ticker_id } }
    assert_redirected_to portfolio_url(@portfolio)
  end

  test "should destroy portfolio" do
    assert_difference('Portfolio.count', -1) do
      delete portfolio_url(@portfolio)
    end

    assert_redirected_to portfolios_url
  end
end
