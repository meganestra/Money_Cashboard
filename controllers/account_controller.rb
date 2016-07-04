require('sinatra')
require( 'sinatra/contrib/all' )
require_relative('../models/account')
require_relative('../models/tag')
require_relative('../models/merchant')
require_relative('../models/transaction')

get '/account' do
  @transactions = Transaction.show()
  @account = Account.new(@transactions)
  erb(:'/account/account')
end

