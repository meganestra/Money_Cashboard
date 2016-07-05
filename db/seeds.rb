require('pry-byebug')
require_relative('sql_runner')
require_relative('../models/tag')
require_relative('../models/target')
require_relative('../models/merchant')
require_relative('../models/transaction')
require_relative('../models/account')

Transaction.delete_all()
Tag.delete_all()
Merchant.delete_all()
Target.delete_all()

tag1 = Tag.new( {'description' => 'Food shopping'} ).save
tag2 = Tag.new( {'description' => 'Lunch'} ).save
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

merchant1 = Merchant.new( {'name' => 'Tesco'} ).save
merchant2 = Merchant.new( {'name' => 'Subway'} ).save
merchant3 = Merchant.new( {'name' => 'Starbucks'} ).save
merchant4 = Merchant.new( {'name' =>  'Cineworld'} ).save
merchant5 = Merchant.new( {'name' => 'Sainsburys'} ).save
merchant6 = Merchant.new( {'name' => 'Council'} ).save
merchant7 = Merchant.new( {'name' => 'SSE'} ).save
merchant8 = Merchant.new( {'name' => 'Tinderbox'} ).save
merchant9 = Merchant.new( {'name' => 'Salary'} ).save
merchant10 = Merchant.new( {'name' => 'iTunes'} ).save

target1 = Target.new( {'type' => 'savings', 'month' => 'June', 'value' => 150} ).save
target2 = Target.new( {'type' => 'debt repayment', 'month' => 'June', 'value' => 50} ).save

transaction1 = Transaction.new( {
  'merchant_id' => merchant1.id,
  'tag_id' => tag1.id,
  'amount' => 15.63,
  'date' => '2016-06-05',
  'time' => '12:00',
  'transaction_type' => 'debit',
  'payment_type' => 'cash',
  'shopping_method' => 'in-store'
  }).save
transaction1 = Transaction.new( {
  'merchant_id' => merchant1.id,
  'tag_id' => tag1.id,
  'amount' => 12.33,
  'date' => '2016-06-05',
  'time' => '12:00',
  'transaction_type' => 'debit',
  'payment_type' => 'cash',
  'shopping_method' => 'in-store'
  }).save
transaction1 = Transaction.new( {
  'merchant_id' => merchant1.id,
  'tag_id' => tag1.id,
  'amount' => 40,
  'date' => '2016-06-05',
  'time' => '12:00',
  'transaction_type' => 'debit',
  'payment_type' => 'cash',
  'shopping_method' => 'in-store'
  }).save



binding.pry
nil

