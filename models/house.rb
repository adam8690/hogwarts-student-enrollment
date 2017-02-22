class House

  attr_accessor :name, :logo

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @logo = options['logo']

  end
  def save
    sql = "INSERT INTO houses (name, logo) VALUES ('#{@name}', '#{@logo}') RETURNING *;"
    house = SqlRunner.run(sql)
    @id = house.first['id'].to_i
  end

  def self.find_all
    sql = "SELECT * FROM houses;"
    houses = SqlRunner.run(sql)
    return houses.map{ |house| house.new(house)}
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id=#{@id};"
    house =SqlRunner.run(sql)
    return house.new(house.first)
  end

  def self.delete_all
    sql= "DELETE FROM houses;"
    SqlRunner.run(sql)
  end

end