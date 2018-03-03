# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PASSWORD = 'supersecret'

Slack.destroy_all
User.destroy_all



super_user = User.create(
  first_name: 'Wes',
  last_name: 'Corman',
  email: 'wcorman@gmail.com',
  password: PASSWORD,
  is_admin: true
)

12.times.each do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD
  )
end

users = User.all


50.times.each do
  Slack.create(
    prod_time: rand(20..40),
    unprod_time: rand(10..40),
    sleep_time: rand(20..35),
    user: users.sample
  )
end

slacks = Slack.all


puts Cowsay.say "Created #{users.count} users", :tux
puts Cowsay.say "Created #{slacks.count} Slacks", :frogs
puts "Login as admin with #{super_user.email} and password of '#{PASSWORD}'!"
