require('pg')
require_relative('../db/sql_runner')
require_relative('transaction')

class Merchant

  attr_reader(:id, :name)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  #save(CREATE)
  def save()
    sql = "INSERT INTO merchants (name) VALUES ('#{@name}') RETURNING *"
    merchant = run(sql).first
    return Merchant.new(merchant)
  end

  #transactions(show all associated transactions)
  def transactions()
    sql = "SELECT * FROM transactions WHERE merchant_id = #{@id}"
    results = Transaction.map_items(sql)
    return results
  end

  #update(UPDATE)

  #show all(READ)
  def self.show()
    sql = "SELECT * FROM merchants"
    tags = Merchant.map_items(sql)
  end

  #find(one tag)
  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = #{id}"
    merchant = Merchant.map_item(sql)
  end

  #delete all(DELETE)
  def self.delete_all()
    sql = "DELETE FROM tags"
    run(sql)
  end

  #map items
  def self.map_items(sql)
    merchants = run(sql)
    results = merchants.map { |merchant| Merchant.new(merchant) }
    return results
  end

  #map item
  def self.map_item(sql)
    merchant = Merchant.map_items(sql)
    return merchant.first
  end

end