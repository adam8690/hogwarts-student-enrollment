require_relative ('../db/sqlrunner.rb')



class Student

  attr_accessor :first_name, :last_name, :house, :age

def initialize(options)
  @id = options['id']
  @first_name = options['first_name']
  @last_name = options['last_name']
  @house = options['house']
  @age = options['age'].to_i
end

def save
  sql = "INSERT INTO students (first_name, last_name, house, age) VALUES ('#{@first_name}', '#{@last_name}', '#{@house}', #{@age}) RETURNING *;"
  student = SqlRunner.run(sql)
  @id = student.first['id'].to_i
end

def self.find_all
  sql = "SELECT * FROM students;"
  students = SqlRunner.run(sql)
  return students.map{ |student| Student.new(student)}
end

def self.find(id)
  sql = "SELECT * FROM students WHERE id=#{@id};"
  student =SqlRunner.run(sql)
  return Student.new(student.first)
end

def full_name()
  "#{@first_name} #{@last_name}"
end

def self.delete_all
  sql= "DELETE FROM students;"
  SqlRunner.run(sql)
end

end