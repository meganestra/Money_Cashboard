require('sinatra')
require( 'sinatra/contrib/all' )
require_relative('../models/account')
require_relative('../models/tag')
require_relative('../models/merchant')
require_relative('../models/transaction')
require_relative('../models/target')


get '/target/new' do
  erb(:'/target/new')
end

post '/target' do
  @target = Target.new(params)
  @target.save
  erb(:'/target/create')
end

get '/target' do
 @targets = Target.show()
 erb(:'/target/index')
end

get '/target/analysis' do
  @targets = Target.show()
  @transactions = Transaction.show()
  @accounts = Account.new(@transactions)
  erb(:'target/target')
end
