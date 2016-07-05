require('pg')
require_relative('../db/sql_runner')
require_relative('tag')
require_relative('merchant')
require_relative('transaction')

class Account

  attr_reader(:transactions)

  def initialize(transactions)
    @transactions = transactions
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
    result = target.value - account_balance if balance_against_target(target) == false
    return result.round(1)
  end

  def calculate_round_up_value()
    total_round_up_value = 0
    @transactions.each do |transaction|
      total_round_up_value += (transaction.amount).to_f.ceil if transaction.transaction_type == "debit"
    end
    result = total_round_up_value - account_outgoings
    return result.round(1)
  end

end











