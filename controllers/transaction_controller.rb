require('sinatra')
require( 'sinatra/contrib/all' )
require_relative('../models/transaction')
require_relative('../models/account')
require_relative('../models/merchant')
require_relative('../models/tag')
require('pry-byebug')

get  '/transaction/new'  do
  @merchants = Merchant.show()
  @tags = Tag.show()
  erb(:'/transaction/new')
end

post '/transaction' do
  @transaction = Transaction.new(params)
  @transaction.save
  erb(:'/transaction/create')
end

get '/transaction' do
  query = params[:search]
  @transaction = Transaction.all(query)
  @transactions = Transaction.show()
  @merchants = Merchant.show()
  @tags = Tag.show()
  @account = Account.new(@transactions)
  erb(:'transaction/index')
end
