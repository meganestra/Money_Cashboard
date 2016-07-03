require('pg')
require_relative('../db/sql_runner')

class Target

  attr_reader(:id, :type, :month, :value)

  def initialize(options)
    @id = options['id'].to_i
    @type = options['type']
    @month = options['month']
    @value = options['value'].to_i
  end

  #save(CREATE)
  def save()
    sql = "INSERT INTO targets (type, month, value) VALUES ('#{@type}', '#{@month}', #{@value}) RETURNING *"
    target = run(sql).first
    return Target.new(target)
  end

  #transactions(show all associated transactions)

  #update(UPDATE)

  #show all(READ)
  def self.show()
    sql = "SELECT * FROM targets"
    targets = Target.map_items(sql)
  end

  #find(one tag)
  def self.find(id)
    sql = "SELECT * FROM targets WHERE id = #{id}"
    target = Target.map_item(sql)
  end

  #delete all(DELETE)
  def self.delete_all()
    sql = "DELETE FROM targets"
    run(sql)
  end

  #map items
  def self.map_items(sql)
    targets = run(sql)
    results = targets.map { |target| Target.new(target) }
    return results
  end

  #map item
  def self.map_item(sql)
    target = Target.map_items(sql)
    return target.first
  end

end