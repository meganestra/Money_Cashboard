require('minitest/autorun')
require_relative('../models/account')
require_relative('../models/target')

class TestAccount < Minitest::Test

  def setup

    tag1 = Tag.new( {'description' => 'Food shopping'} )
    tag2 = Tag.new( {'description' => 'Lunch out'} )
    
    merchant1 = Merchant.new( {'name' => 'Tesco'} )
    merchant2 = Merchant.new( {'name' => 'Subway'} )

    transaction1 = Transaction.new( {
      'merchant_id' => 1,
      'tag_id' => 2,
      'amount' => 40.00,
      'date' => '2016-06-05',
      'time' => '12:00',
      'transaction_type' => 'debit',
      'payment_type' => 'cash',
      'shopping_method' => 'in-store'
      })
    transaction2 = Transaction.new( {
      'merchant_id' => 2,
      'tag_id' => 3,
      'amount' => 20.20,
      'date' => '2016-06-05',
      'time' => '14:00',
      'transaction_type' => 'debit',
      'payment_type' => 'cash',
      'shopping_method' => 'in-store'
      })
    transaction3 = Transaction.new( {
      'merchant_id' => 3,
      'tag_id' => 4,
      'amount' => 1500.00,
      'date' => '2016-06-01',
      'time' => '09:00',
      'transaction_type' => "credit"
      })
    transaction4 = Transaction.new( {
      'merchant_id' => 23,
      'tag_id' => 4,
      'amount' => 150.00,
      'date' => '2016-06-01',
      'time' => '09:00',
      'transaction_type' => "credit"
      })

    @target1 = Target.new( {'type' => 'savings', 'month' => 'June', 'value' => 150} ).save
    @target2 = Target.new( {'type' => 'debt repayment', 'month' => 'June', 'value' => 10} ).save
    @target3 = Target.new( {'type' => 'savings', 'month' => 'June', 'value' => 2000} ).save

    @account = Account.new([transaction1, transaction2, transaction3, transaction4])

  end

  def test_total_income()
    assert_equal(1650.00, @account.account_income())
  end

  def test_total_spending()
    assert_equal(60.20, @account.account_outgoings())
  end

  def test_account_balance()
    assert_equal(1589.80, @account.account_balance())
  end

  def test_account_balance_greater_than_target()
    assert_equal(true, @account.balance_against_target(@target1))
  end

  def test_account_balance_less_than_target()
    assert_equal(false, @account.balance_against_target(@target3))
  end

  def test_amount_remaining_to_reach_target()
    assert_equal(410.20, @account.calculate_amount_to_reach_target(@target3))
  end

  # def test_total_expenditure()
  #   assert_equal(-60.20, @account.total_expenditure())
  # end

  # def  test_total_expenditure_by_tag()
  #   assert_equal(-20.20, @account.total_expenditure_by_tag(3))
  # end

  # def test_total_expenditure_greater_than_target()
  #   assert_equal(true, @account.total_expenditure_against_target(@target2))
  # end

  # def test_total_expenditure_less_than_target()
  #   assert_equal(false, @account.total_expenditure_against_target(@target1))
  # end

  # def test_amount_remaining_to_reach_target()
  #   assert_equal(89.80, @account.calculate_amount_to_reach_target(@target1))
  # end

  def test_calculate_round_up_value_of_account()
    assert_equal(0.80, @account.calculate_round_up_value())
  end

end




















