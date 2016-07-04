require('pg')
require_relative('../db/sql_runner')
require_relative('tag')
require_relative('merchant')

class Transaction

  attr_reader(:id, :merchant_id, :tag_id, :amount, :date, :time, :transaction_type, :payment_type, :shopping_method)

  def initialize(options)
    @id = options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @amount = options['amount']
    @date = options['date']
    @time = options['time']
    @transaction_type = options['transaction_type']
    @payment_type = options['payment_type']
    @shopping_method = options['shopping_method']
  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, tag_id, amount, date, time, transaction_type, payment_type, shopping_method) VALUES
    (#{@merchant_id}, #{@tag_id}, '#{@amount}', '#{@date}', '#{@time}', '#{@transaction_type}', '#{@payment_type}', '#{@shopping_method}') RETURNING *"
    return Transaction.map_item(sql)
  end

  #update

  def self.show()
    sql = "SELECT * FROM transactions"
    return Transaction.map_items(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM transactions WHERE id = #{id}"
    return Transaction.map_item(sql)
  end

  def self.find_by_month(month)
    sql = "SELECT * FROM transactions WHERE month = #{month}"
    return Transaction.map_items(sql)
  end

  def self.find_by_tag(tag)
    sql = "SELECT * FROM transactions WHERE tag = #{tag}"
    return Transaction.map_items(sql)
  end

  def self.find_by_merchant(merchant)
    sql = "SELECT * FROM transactions WHERE merchant = #{merchant}"
    return Transaction.map_items(sql)
  end

  def self.find_by_transaction_type(transaction_type)
    sql = "SELECT * FROM transactions WHERE transaction_type = #{transaction_type}"
    return Transaction.map_items(sql)
  end

  def self.find_by_payment_type(payment_type)
    sql = "SELECT * FROM transactions WHERE payment_type = #{payment_type}"
    return Transaction.map_items(sql)
  end

  def self.find_by_shopping_method(shopping_method)
    sql = "SELECT * FROM transactions WHERE shopping_method = #{shopping_method}"
    return Transaction.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    run(sql)
  end

  def self.map_items(sql)
    transactions = run(sql)
    result = transactions.map { |transaction| Transaction.new(transaction) }
    return result
  end

  def self.map_item(sql)
    transaction = Transaction.map_items(sql)
    return transaction.first
  end

end