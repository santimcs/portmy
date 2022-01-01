class DailyPricesController < ApplicationController
  before_action :set_daily_price, only: [:show, :edit, :update, :destroy]

  # GET /daily_prices
  # GET /daily_prices.json
  def index
    @daily_prices = DailyPrice.all
  end

  # GET /daily_prices/1
  # GET /daily_prices/1.json
  def show
  end

  # GET /daily_prices/new
  def new
    @daily_price = DailyPrice.new
  end

  # GET /daily_prices/1/edit
  def edit
  end

  # POST /daily_prices
  # POST /daily_prices.json
  def create
    @daily_price = DailyPrice.new(daily_price_params)

    respond_to do |format|
      if @daily_price.save
        format.html { redirect_to @daily_price, notice: 'Daily price was successfully created.' }
        format.json { render :show, status: :created, location: @daily_price }
      else
        format.html { render :new }
        format.json { render json: @daily_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_prices/1
  # PATCH/PUT /daily_prices/1.json
  def update
    respond_to do |format|
      if @daily_price.update(daily_price_params)
        format.html { redirect_to @daily_price, notice: 'Daily price was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_price }
      else
        format.html { render :edit }
        format.json { render json: @daily_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_prices/1
  # DELETE /daily_prices/1.json
  def destroy
    @daily_price.destroy
    respond_to do |format|
      format.html { redirect_to daily_prices_url, notice: 'Daily price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_price
      @daily_price = DailyPrice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_price_params
      params.require(:daily_price).permit(:name, :date, :open_price, :max_price, :min_price, :price, :qty, :ticker_id)
    end
end
