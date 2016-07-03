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



end