require('minitest/autorun')
require_relative('../models/account')

class TestAccount < Minitest::Test

  def setup

    tag1 = Tag.new( {'description' => 'Food shopping'} )
    tag2 = Tag.new( {'description' => 'Lunch out'} )
    
    merchant1 = Merchant.new( {'name' => 'Tesco'} )
    merchant2 = Merchant.new( {'name' => 'Subway'} )

    transaction1 = Transaction.new( {
      'merchant_id' => merchant1.id,
      'tag_id' => tag1.id,
      'amount' => 40.00,
      'date' => '2016-06-05',
      'time' => '12:00',
      'transaction_type' => 'debit',
      'payment_type' => 'cash',
      'shopping_method' => 'in-store'
      })
    transaction2 = Transaction.new( {
      'merchant_id' => merchant1.id,
      'tag_id' => tag1.id,
      'amount' => 1.20,
      'date' => '2016-06-05',
      'time' => '14:00',
      'transaction_type' => 'debit',
      'payment_type' => 'cash',
      'shopping_method' => 'in-store'
      })

    @account = Account.new([transaction1, transaction2])

  end

  def test_total_expenditure()
    assert_equal(41.20, @account.total_expenditure())
  end




end




















