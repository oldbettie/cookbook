# The data can be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples:
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

User.create(email: 'jj@gmail.com', username: 'oldbettie', password: 'chicken', admin: 'true')
User.create(email: 'spongebob@gmail.com', username: 'spongebob', password: 'chicken')
User.create(email: 'patrick@gmail.com', username: 'patrick', password: 'chicken')

puts ":total seeded users is #{ User.count }"
