require('pg')
require_relative('../db/sql_runner')
require_relative('tag')
require_relative('merchant')
require_relative('transaction')
require_relative('target')

class Account

  attr_reader(:transactions, :targets)

  def initialize(transactions, targets)
    @transactions = transactions
    @targets = targets
  end

  def account_income()
    total_income = 0
    @transactions.each do |transaction|
      total_income += transaction.amount if transaction.transaction_type.downcase == "credit"
    end
    return total_income.to_f
  end

  def account_income_by_tag(tag)
    total_income = 0
    @transactions.each do |transaction|
      total_income += transaction.amount if transaction.transaction_type.downcase == "credit" && transaction.tag_id == tag
    end
    return total_income.to_f
  end

  def account_outgoings()
    total_outgoings = 0
    @transactions.each do |transaction|
      total_outgoings += transaction.amount if transaction.transaction_type.downcase == "debit"
    end
    return total_outgoings.to_f
  end

  def account_outgoings_by_tag(tag)
    total_outgoings = 0
    @transactions.each do |transaction|
      total_outgoings += transaction.amount if transaction.transaction_type.downcase == "debit" && transaction.tag_id == tag
    end
    return total_outgoings.to_f
  end

  def account_balance()
    result = account_income - account_outgoings
    return result.to_f
  end

  def balance_against_target(target)
    return account_balance > target.value
  end

  def calculate_amount_to_reach_target(target)
    if balance_against_target(target) == false
      result = target.value - account_balance
    else result = 0
    end
    return result.round(2)
  end

  def calculate_round_up_value()
    total_round_up_value = 0
    @transactions.each do |transaction|
      total_round_up_value += (transaction.amount).ceil if transaction.transaction_type.downcase == "debit"
    end
    result = total_round_up_value - account_outgoings
    return result.round(2)
  end

  def number_of_micro_transactions()
    total_micro_transactions = 0
    @transactions.each do |transaction|
      total_micro_transactions += transaction.amount if transaction.amount < 10 && transaction.transaction_type.downcase == "debit"
      end
    return total_micro_transactions 
  end

  def all_debit_transaction_amounts
    debit_transaction_amounts = @transactions.map { |transaction| transaction.amount if transaction.transaction_type.downcase == "debit" }
    return debit_transaction_amounts.compact
  end

  def min_debit_amount
    result = all_debit_transaction_amounts
    return result.min
  end

  def max_debit_amount
    result = all_debit_transaction_amounts
    return result.max
  end

  def total_number_of_credit_transactions
    credits = []
    @transactions.each do |transaction|
      credits << transaction if transaction.transaction_type.downcase == "credit"
    end
    return credits.count
  end

  def total_number_of_debit_transactions
    debits = []
    @transactions.each do |transaction|
      debits << transaction if transaction.transaction_type.downcase == "debit"
    end
    return debits.count
  end

  def total_number_of_transactions
    result = total_number_of_credit_transactions + total_number_of_debit_transactions
    return result
  end

  def total_targets_value()
    total_target_value = 0
    @targets.each do |target|
      total_target_value += target.value
    end
    return total_target_value
  end

  def balance_against_total_target_value()
    return account_balance > total_targets_value
  end

  def calculate_amount_to_reach_total_target_value()
    if balance_against_total_target_value == false
      result = total_targets_value - account_balance
    else
      result = 0
    end
    return result.round(2)
  end

  def calculate_new_balance_post_target(target)
      new_account_balance = account_balance - target.value if balance_against_target(target) == true
      return new_account_balance.round(2)
  end

  def account_balance_minus_round_ups
    adjusted_balance = account_balance - calculate_round_up_value
    return adjusted_balance.round(2)
  end

end











