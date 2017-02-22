require( 'sinatra')
require( 'sinatra/contrib/all')
require( 'pry' )
require( './models/student.rb' )
require( './models/house.rb' )

get '/students' do
  @students = Student.find_all()
  erb(:index)
end

get '/students/new' do
  @houses = House.find_all
  erb(:new)
end

post '/students' do 
  @student = Student.new( params )
  @student.save
  erb(:create)
end