require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( 'extensions/float')
require_relative('controllers/transaction_controller')
require_relative('controllers/account_controller')
require_relative('controllers/target_controller')
require_relative('controllers/merchant_controller')
require_relative('controllers/tag_controller')

get '/' do
  erb (:home)
end

