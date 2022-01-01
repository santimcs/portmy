class TickersController < ApplicationController
  before_action :set_ticker, only: [:show, :edit, :update, :destroy]

  # GET /tickers
  # GET /tickers.json
  def index
    @tickers = Ticker.all
  end

  # GET /tickers/1
  # GET /tickers/1.json
  def show
  end

  # GET /tickers/new
  def new
    @ticker = Ticker.new
  end

  # GET /tickers/1/edit
  def edit
  end

  # POST /tickers
  # POST /tickers.json
  def create
    @ticker = Ticker.new(ticker_params)

    respond_to do |format|
      if @ticker.save
        format.html { redirect_to @ticker, notice: 'Ticker was successfully created.' }
        format.json { render :show, status: :created, location: @ticker }
      else
        format.html { render :new }
        format.json { render json: @ticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickers/1
  # PATCH/PUT /tickers/1.json
  def update
    respond_to do |format|
      if @ticker.update(ticker_params)
        format.html { redirect_to @ticker, notice: 'Ticker was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticker }
      else
        format.html { render :edit }
        format.json { render json: @ticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickers/1
  # DELETE /tickers/1.json
  def destroy
    @ticker.destroy
    respond_to do |format|
      format.html { redirect_to tickers_url, notice: 'Ticker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticker
      @ticker = Ticker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticker_params
      params.require(:ticker).permit(:name, :full_name, :sector, :subsector, :market, :website)
    end
end
