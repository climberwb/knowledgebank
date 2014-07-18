require 'faker'

#creates wikis

50.times do 
  Wiki.create(
    title: Faker::Lorem.sentence,
    category: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
    )
end

wikis = Wiki.all

puts "Seeds finsihed"
puts "#{Wiki.count} wikis created"


