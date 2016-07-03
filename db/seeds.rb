require('pry-byebug')
require_relative('sql_runner')
require_relative('../models/tag')
# require_relative('../models/target')
# require_relative('../models/merchant')
# require_relative('../models/transaction')

Tag.delete_all()
# Merchant.delete_all()
# Target.delete_all()
# Transaction.delete_all()

tag1 = Tag.new( {'description' => 'Food shopping'} ).save
tag2 = Tag.new( {'description' => 'Lunch out'} ).save
tag3 = Tag.new( {'description' => 'Rent'} ).save
tag4 = Tag.new( {'description' => 'Clothing'} ).save
tag5 = Tag.new( {'description' => 'Mobile phone'} ).save
tag6 = Tag.new( {'description' => 'Restaurants, pubs and bars'} ).save
tag7 = Tag.new( {'description' => 'Fuel'} ).save
tag8 = Tag.new( {'description' => 'Energy bills'} ).save
tag9 = Tag.new( {'description' => 'Council tax'} ).save
tag10 = Tag.new( {'description' => 'Kids'} ).save
tag11 = Tag.new( {'description' => 'Travel'} ).save
tag12 = Tag.new( {'description' => 'Fun'} ).save
tag13 = Tag.new( {'description' => 'Miscellaneous'} ).save
tag14 = Tag.new( {'description' => 'Gifts'} ).save
tag15 = Tag.new( {'description' => 'Music'} ).save

#merchants

#targets

#transactions




binding.pry
nil

