require('pg')
require_relative('../db/sql_runner')

class Tag

  attr_reader(:id, :description)

  def initialize(options)
    @id = options['id'].to_i
    @description = options['description']
  end

  #save(CREATE)
  def save()
    sql = "INSERT INTO tags (description) VALUES ('#{@description}') RETURNING *"
    tag = run(sql).first
    return Tag.new(tag)
  end

  #transactions(show all associated transactions)

  #update(UPDATE)

  #show all(READ)

  #find(one tag)

  #delete all(DELETE)
  def self.delete_all()
    sql = "DELETE FROM tags"
    run(sql)
  end

end
