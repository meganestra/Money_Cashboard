require('sinatra')
require( 'sinatra/contrib/all' )
require_relative('../models/account')
require_relative('../models/tag')
require_relative('../models/merchant')
require_relative('../models/transaction')
require_relative('../models/target')

get '/account' do
  @transactions = Transaction.show()
  @tags = Tag.show()
  @targets = Target.show()
  @account = Account.new(@transactions, @targets)
  erb(:'/account/account')
end

