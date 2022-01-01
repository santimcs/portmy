class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  # GET /portfolios
  # GET /portfolios.json
  def index
    @portfolios = Portfolio.order(name: :asc)  
    @discounts = Discount.first 
  end
  
  def new_low
    @portfolios = Portfolio.order(name: :asc)  
    @discounts = Discount.first 
  end

  def below_disc
    @portfolios = Portfolio.order(name: :asc)  
    @discounts = Discount.first 
  end  

  def list_sell_alert
    @portfolios = Portfolio.where("comp_qty > 0").order(name: :asc)
  end

  def list_buy_alert
    @portfolios = Portfolio.where("buy_qty > 0").order(name: :asc)
  end

  # GET /portfolios/1
  # GET /portfolios/1.json
  def show
  end

  # GET /portfolios/new
  def new
    @portfolio = Portfolio.new
  end

  # GET /portfolios/1/edit
  def edit
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
    @portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to @portfolio, notice: 'Portfolio was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolios/1
  # PATCH/PUT /portfolios/1.json
  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to @portfolio, notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:name, :date, :buy_qty, :comp_qty, :att_qty, :buy_unit_cost, :comp_unit_cost, :att_unit_cost, :buy_cost_amt, :comp_cost_amt, :att_cost_amt, :last_sell_price, :sell_qty, :target_sell_price, :buy_method, :sell_method, :ticker_id)
    end
end
