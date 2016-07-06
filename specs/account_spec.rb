require('minitest/autorun')
require_relative('../models/account')
require_relative('../models/target')
require('pry-byebug')

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
    transaction5 = Transaction.new( {
      'merchant_id' => 23,
      'tag_id' => 5,
      'amount' => 8.20,
      'date' => '2016-06-01',
      'time' => '09:00',
      'transaction_type' => "debit"
      })


    @target1 = Target.new( {'type' => 'savings', 'month' => 'June', 'value' => 150} )
    @target2 = Target.new( {'type' => 'debt repayment', 'month' => 'June', 'value' => 10} )
    @target3 = Target.new( {'type' => 'savings', 'month' => 'June', 'value' => 2000} )

    @account = Account.new([transaction1, transaction2, transaction3, transaction4, transaction5], [@target1, @target2, @target3])

  end

  def test_total_income()
    assert_equal(1650.00, @account.account_income())
  end

  def test_total_spending()
    assert_equal(68.40, @account.account_outgoings())
  end

  def test_account_balance()
    assert_equal(1581.60, @account.account_balance())
  end

  def test_account_balance_greater_than_target()
    assert_equal(true, @account.balance_against_target(@target1))
  end

  def test_account_balance_less_than_target()
    assert_equal(false, @account.balance_against_target(@target3))
  end

  def test_amount_remaining_to_reach_target()
    assert_equal(418.40, @account.calculate_amount_to_reach_target(@target3))
  end

  def test_calculate_round_up_value_of_account()
    assert_equal(1.60, @account.calculate_round_up_value())
  end

  def test_account_outgoings_by_tag()
    assert_equal(40.00, @account.account_outgoings_by_tag(2))
  end

  def test_account_income_by_tag()
    assert_equal(1650.00, @account.account_income_by_tag(4))
  end

  def test_micro_transactions()
    assert_equal(8.20, @account.number_of_micro_transactions())
  end

  def test_max_transaction()
    assert_equal(40.00, @account.max_debit_amount())
  end

  def test_min_transaction()
    assert_equal(8.20, @account.min_debit_amount())
  end

  def test_number_of_transactions()
    assert_equal(5, @account.total_number_of_transactions())
  end

  def test_number_of_credit_transactions()
    assert_equal(2, @account.total_number_of_credit_transactions())
  end

  def test_number_of_debit_transactions()
    assert_equal(3, @account.total_number_of_debit_transactions())
  end

  def test_total_target_value()
    assert_equal(2160, @account.total_targets_value())
  end

  def test_total_target_value_against_total_balance()
    assert_equal(false, @account.balance_against_total_target_value())
  end

  def test_amount_to_reach_total_target_value()
    assert_equal(578.40, @account.calculate_amount_to_reach_total_target_value())
  end

end






# binding.pry
# nil















