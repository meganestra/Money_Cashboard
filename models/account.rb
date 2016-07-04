require('pg')
require_relative('../db/sql_runner')
require_relative('tag')
require_relative('merchant')
require_relative('transaction')

class Account

  attr_reader(:accounts)
#change to transactions
  def initialize(accounts)
    @accounts = accounts
  end

  def account_income()
    total_income = 0
    @accounts.each do |account|
      total_income += account.amount if account.transaction_type.downcase == "credit"
    end
    return total_income
  end

  def account_outgoings()
    total_outgoings = 0
    @accounts.each do |account|
      total_outgoings += account.amount if account.transaction_type.downcase == "debit"
    end
    return total_outgoings
  end

  def account_balance()
    return account_income - account_outgoings
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
    @accounts.each do |account|
      total_round_up_value += (account.amount).to_f.ceil if account.transaction_type == "debit"
    end
    result = total_round_up_value - account_outgoings
    return result.round(1)
  end

end











