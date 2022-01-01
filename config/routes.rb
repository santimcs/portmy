Rails.application.routes.draw do

  resources :discounts
  resources :daily_prices
#  get 'pages/home'
  resources :portfolios
  resources :stocks
  resources :tickers
  resources :profits
  #root 'profits#index', as: 'profits_index'
  root :to => 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get "/list_profits", to: 'profits#list_profits'
    get "/list_profits_q1", to: 'profits#list_profits_q1'    
    get "/list_profits_q2", to: 'profits#list_profits_q2'   
    get "/list_profits_q3", to: 'profits#list_profits_q3'            
    get "/list_profits_q4", to: 'profits#list_profits_q4'
    get "/list_sell_alert", to: 'portfolios#list_sell_alert'
    get "/list_buy_alert", to: 'portfolios#list_buy_alert'
    get "/new_low", to: 'portfolios#new_low'
    get "/below_disc", to: 'portfolios#below_disc'    

end
