# The data can be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples:
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

User.create(email: 'jj@gmail.com', username: 'oldbettie', password: 'chicken', admin: 'true')
User.create(email: 'spongebob@gmail.com', username: 'spongebob', password: 'chicken')
User.create(email: 'patrick@gmail.com', username: 'patrick', password: 'chicken')

puts ":total seeded users is #{ User.count }"


# recipe seed data
Recipe.destroy_all
Recipe.create(name: 'meat pie', ingredients: 'groundbeef, gravy, pastry', instructions: 'bake at 220c for 120min', image: 'https://157212-453144-1-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2020/04/classic-meat-pies-1-1024x683@2x.jpg')
Recipe.create(name: 'sausage roll', ingredients: 'sausages, pastry', instructions: 'bake at 220c for 120min', image: 'https://img.taste.com.au/kv8NEC44/w720-h480-cfill-q80/taste/2016/11/easy-sausage-rolls-28532-1.jpeg')
Recipe.create(name: 'salad', ingredients: 'rabit food, salad dressing', instructions: 'slap it in a bowl and eat like a rabbit', image: 'https://cdn.loveandlemons.com/wp-content/uploads/2021/04/green-salad-1.jpg')

puts ":total seeded recipes is #{ Recipe.count }"