require('pg')
require_relative('../db/sql_runner')
require_relative('tag')
require_relative('merchant')
require_relative('transaction')

class Account

  attr_reader(:accounts)

  def initialize(accounts)
    @accounts = accounts
  end

  def account_income()
    total_income = 0
    @accounts.each do |account|
      total_income += account.amount if account.transaction_type == "credit"
    end
    return total_income
  end

  def account_outgoings()
    total_outgoings = 0
    @accounts.each do |account|
      total_outgoings += account.amount if account.transaction_type == "debit"
    end
    return total_outgoings
  end

  def account_balance()
    return account_income - account_outgoings
  end

  # def total_expenditure()
  #   total = 0
  #   @accounts.each do |account|
  #       total += account.amount if account.transaction_type == "credit"
  #       total -= account.amount if account.transaction_type == "debit"
  #     end
  #   return total
  # end

  # def total_expenditure_by_tag(tag_id)
  #   total = 0
  #   @accounts.each do |account|
  #     # account.total_expenditure if account.tag_id == tag_id
  #     total += account.amount if account.transaction_type == "credit" && account.tag_id == tag_id
  #     total -= account.amount if account.transaction_type == "debit" && account.tag_id == tag_id
  #   end
  #   return total
  # end

  # def total_expenditure_against_target(target)
  #   return total_expenditure > target.value
  # end

  # def calculate_amount_to_reach_target(target)
  #   return  target.value - total_expenditure if total_expenditure_against_target(target) == false
  # end

  # def calculate_round_up_value()
  #   total = 0
  #   @accounts.each do |account|
  #     total += (account.amount).to_f.ceil
  #   end
  #   result = total - total_expenditure
  #   return result.round(1)
  # end

end











