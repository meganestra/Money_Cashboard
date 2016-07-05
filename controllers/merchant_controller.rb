require('sinatra')
require( 'sinatra/contrib/all' )
require_relative('../models/transaction')
require_relative('../models/merchant')
require_relative('../models/tag')
require('pry-byebug')

get '/merchant/new' do
  @merchants = Merchant.show()
  erb(:'/merchant/new')
end

post '/merchant' do
  @merchant = Merchant.new(params)
  @merchant.save
  erb(:'/merchant/create')
end

get '/merchant' do
  @merchants = Merchant.show()
  erb(:'merchant/index')
end