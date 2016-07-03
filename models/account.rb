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

  #total expenditure
  def total_expenditure()
    total = 0
    @accounts.each do |account|
      total += account.amount
    end
    return total
  end

  def total_expenditure_by_tag(tag_id)
    total = 0
    @accounts.each do |account|
      if account.tag_id == tag_id
      total += account.amount
      end
    end
    return total
  end

  def total_expenditure_against_target(target)
    return total_expenditure > target.value
  end

  def calculate_amount_to_reach_target(target)
    # if total expen against target is false
    # subtract the total expenditure from the target value

    return  target.value - total_expenditure if total_expenditure_against_target(target) == false

  end

end











