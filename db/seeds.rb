# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Tweet.destroy_all
User.destroy_all

# Create 3 users
user = User.create(email: "tetyana@example.com", password: "password", password_confirmation: "password")
puts "Created user: #{user.email}"
user = User.create(email: "nottetyana@example.com", password: "password", password_confirmation: "password")
puts "Created user: #{user.email}"
user = User.create(email: "otherperson@example.com", password: "password", password_confirmation: "password")
puts "Created user: #{user.email}"

50.times do
  tweet = Tweet.create(
    body: Faker::Lorem.sentence(word_count: 4),
    user_id: User.all.sample.id)
  puts "Created tweet: #{tweet.id}"
end
