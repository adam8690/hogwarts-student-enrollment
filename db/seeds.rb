require_relative('../models/student.rb')

student1= Student.new({
"first_name" => "Harry",
"last_name" => "Potter",
"house" => "Gryffindor",
"age" => "27"
})

student2 = Student.new({
  "first_name" => "Draco",
  "last_name" => "Malfoy",
  "house" => "Slytherin",
  "age" => "29"
})

student3 = Student.new({
  "first_name" => "Hermione",
  "last_name" => "Granger",
  "house" => "Gryffindor",
  "age" => "26"
})

student1.save()
student2.save()
student3.save()


