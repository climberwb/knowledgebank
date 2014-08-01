require 'faker'



#creates users
5.times do 
  user = User.new(

    name:   Faker::Name.name,
    email:  Faker::Internet.email,
    password:  Faker::Lorem.characters(10)
    )
  user.save
end

users = User.all



#creates wikis
Wiki.destroy_all
50.times do 
  Wiki.create(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
    )
end

wikis = Wiki.all

puts "Seeds finsihed"
puts "#{Wiki.count} wikis created"

User.first.update_attributes(
 email: 'warren.kushner@gmail.com',
 password: 'helloworld',
  )
puts "Seeds finished"
puts "#{User.count} Users"
puts "#{Wiki.count} Wikis"


