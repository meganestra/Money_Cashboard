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
  # def self.update(options)
  #   sql = "UPDATE tags SET description='#{options['description']}' WHERE id=#{options['id']}"
  #   run(sql)
  # end

  #show all(READ)
  def self.show()
    sql = "SELECT * FROM tags"
    tags = Tag.map_items(sql)
  end

  #find(one tag)
  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = #{id}"
    tag = Tag.map_item(sql)
  end

  #delete all(DELETE)
  def self.delete_all()
    sql = "DELETE FROM tags"
    run(sql)
  end

  #map items
  def self.map_items(sql)
    tags = run(sql)
    results = tags.map { |tag| Tag.new(tag) }
    return results
  end

  #map item
  def self.map_item(sql)
    tag = Tag.map_items(sql)
    return tag.first
  end

end
