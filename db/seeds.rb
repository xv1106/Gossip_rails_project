# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



require 'faker'

# 3.times do
#     cities = City.create!(
#     name: Faker::Address.city ,
#     zip_code: Faker::Address.zip_code
#     )
# end
# puts "3 cities ont été créés"

# users = []
# 10.times do
#   user = User.create!(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     description: Faker::Lorem.sentence,
#     email: Faker::Internet.email,
#     age: Faker::Number.between(from: 18, to: 80),
#     city_id: City.pluck(:id).sample
#   )
#   users << user
# end
# puts "10 users ont été créés"

# 10.times do
#   tag =
#   Tag.create!(
#     title: Faker::Lorem.word
#   )
# end
# puts "10 tags ont été créés"


# 10.times do
#   gossips = 
#   Gossip.create!(
#   title: Faker::Lorem.word,
#   content: Faker::Lorem.sentence(word_count: 5),
#   user: User.all.sample
#   )
# end
# puts "10 gossips ont été créés"

# Gossip.all.each do |gossip|
#   rand(1..3).times do
#     tag = Tag.all.sample
#     gossip.tags << tag unless gossip.tags.include?(tag)
#   end
# end
# puts "Les tags sont attribués !"

# 10.times do
#   sender = users.sample
#   recipients = users.sample(rand(1..3))
#   pm = PrivateMessage.create!(
#     content: Faker::Lorem.paragraph,
#     sender: sender,
#     recipients: recipients
#   )
# end


3.times do
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end
puts "3 cities ont été créés"

# Seed users
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    age: Faker::Number.between(from: 18, to: 80),
    city_id: City.pluck(:id).sample
  )
end
puts "10 users ont été créés"

# Seed tags
10.times do
  Tag.create!(
    title: Faker::Lorem.word
  )
end
puts "10 tags ont été créés"

# Seed gossips
10.times do
  gossip = Gossip.create!(
    title: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 5),
    user: User.all.sample
  )

  # Assign random tags to gossips
  rand(1..3).times do
    tag = Tag.all.sample
    gossip.tags << tag unless gossip.tags.include?(tag)
  end
end
puts "10 gossips ont été créés"

# Seed private messages
puts "Seed private messages"

# Create some sample private messages
10.times do
  # Choose a random sender and receiver
  sender = User.all.sample
  recipient = User.where.not(id: sender.id).sample

  # Create the private message
  private_message = PrivateMessage.create!(
    content: Faker::Lorem.sentence,
    sender: sender,
    recipient: recipient
  )

  puts "Private message from #{sender.first_name} to #{recipient.first_name}: #{private_message.content}"
end

puts "10 private messages have been created"