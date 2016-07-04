require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/transaction_controller')
require_relative('controllers/account_controller')

get '/' do
  erb (:home)
end