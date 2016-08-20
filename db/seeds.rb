SUPPORTERS_TO_CREATE = 500
SUPPORTERS_TO_CREATE.times do
  Supporter.create title:      Faker::StarWars.quote,
                  body:       Faker::Hipster.paragraph,
                  email:        Faker::Internet.email

end

puts Cowsay.say "Created #{SUPPORTERS_TO_CREATE} supporters"
