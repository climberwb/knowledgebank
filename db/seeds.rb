require 'faker'

#creates wikis
Wiki.destroy_all
50.times do 
  Wiki.create(
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
    )
end

wikis = Wiki.all

puts "Seeds finsihed"
puts "#{Wiki.count} wikis created"


