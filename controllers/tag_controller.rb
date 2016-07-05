require('sinatra')
require( 'sinatra/contrib/all' )
require_relative('../models/transaction')
require_relative('../models/merchant')
require_relative('../models/tag')
require('pry-byebug')

get '/tag/new' do
  @tags = Tag.show()
  erb(:'/tag/new')
end

post '/tag' do
  @tag = Tag.new(params)
  @tag.save
  erb(:'/tag/create')
end

get '/tag' do
  @tags = Tag.show()
  erb(:'tag/index')
end