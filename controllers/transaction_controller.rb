require('sinatra')
require_relative('../models/transaction')

get '/transaction/new' do
  erb(:'transaction/new')
end

post '/transaction' do
  @transaction = Transaction.new(options)
  @transaction.save
  erb(:'transaction/create')
end

get '/transaction' do
  @transactions = Transaction.all
  erb(:'transaction/index')
end