require 'test_helper'

class ProfitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profit = profits(:one)
  end

  test "should get index" do
    get profits_url
    assert_response :success
  end

  test "should get new" do
    get new_profit_url
    assert_response :success
  end

  test "should create profit" do
    assert_difference('Profit.count') do
      post profits_url, params: { profit: { inc_amt_pq: @profit.inc_amt_pq, inc_amt_py: @profit.inc_amt_py, inc_amt_q: @profit.inc_amt_q, inc_amt_y: @profit.inc_amt_y, inc_pct_pq: @profit.inc_pct_pq, inc_pct_py: @profit.inc_pct_py, inc_pct_q: @profit.inc_pct_q, inc_pct_y: @profit.inc_pct_y, latest_amt_q: @profit.latest_amt_q, latest_amt_y: @profit.latest_amt_y, name: @profit.name, previous_amt_q: @profit.previous_amt_q, previous_amt_y: @profit.previous_amt_y, q_amt_c: @profit.q_amt_c, q_amt_p: @profit.q_amt_p, quarter: @profit.quarter, y_amt: @profit.y_amt, year: @profit.year } }
    end

    assert_redirected_to profit_url(Profit.last)
  end

  test "should show profit" do
    get profit_url(@profit)
    assert_response :success
  end

  test "should get edit" do
    get edit_profit_url(@profit)
    assert_response :success
  end

  test "should update profit" do
    patch profit_url(@profit), params: { profit: { inc_amt_pq: @profit.inc_amt_pq, inc_amt_py: @profit.inc_amt_py, inc_amt_q: @profit.inc_amt_q, inc_amt_y: @profit.inc_amt_y, inc_pct_pq: @profit.inc_pct_pq, inc_pct_py: @profit.inc_pct_py, inc_pct_q: @profit.inc_pct_q, inc_pct_y: @profit.inc_pct_y, latest_amt_q: @profit.latest_amt_q, latest_amt_y: @profit.latest_amt_y, name: @profit.name, previous_amt_q: @profit.previous_amt_q, previous_amt_y: @profit.previous_amt_y, q_amt_c: @profit.q_amt_c, q_amt_p: @profit.q_amt_p, quarter: @profit.quarter, y_amt: @profit.y_amt, year: @profit.year } }
    assert_redirected_to profit_url(@profit)
  end

  test "should destroy profit" do
    assert_difference('Profit.count', -1) do
      delete profit_url(@profit)
    end

    assert_redirected_to profits_url
  end
end
