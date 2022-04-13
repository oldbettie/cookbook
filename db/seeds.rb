# The data can be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples:
#   Character.create(name: 'Luke', movie: movies.first)
Like.destroy_all
User.destroy_all

u1 = User.create(email: 'jj@gmail.com', username: 'oldbettie', password: 'chicken', admin: 'true')
u2 = User.create(email: 'spongebob@gmail.com', username: 'spongebob', password: 'chicken')
u3 = User.create(email: 'patrick@gmail.com', username: 'patrick', password: 'chicken')

puts ":total seeded users is #{ User.count }"


# recipe seed data
Recipe.destroy_all
r1 = Recipe.create(name: 'Aussie Meat pie', ingredients: 'Groundbeef, Gravy, Pastry', instructions: 'bake at 220c for 120min', image: 'https://157212-453144-1-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2020/04/classic-meat-pies-1-1024x683@2x.jpg')
r2 = Recipe.create(name: 'Home Made Sausage Rolls', ingredients: 'Sausages, Pastry', instructions: 'bake at 220c for 120min', image: 'https://img.taste.com.au/_1PpUELr/w720-h480-cfill-q80/taste/2016/11/best-ever-homemade-sausage-rolls-98809-1.jpeg')
r3 = Recipe.create(name: 'Salad', ingredients: 'rabit food, salad dressing', instructions: 'slap it in a bowl and eat like a rabbit', image: 'https://img.taste.com.au/zVJj4Isw/w720-h480-cfill-q80/taste/2018/08/17-minute-caesar-salad_1980x1320-140424-1.jpg')
r4 = Recipe.create(name: 'Beef Tacos', ingredients: 'Ground beef, Taco shells, Salsa, Cheese, Sour cream', instructions: 'Cook mince and add taco sauce', image: 'https://img.taste.com.au/4F5Z2H_-/w720-h480-cfill-q80/taste/2016/11/aussie-style-beef-and-salad-tacos-86525-1.jpeg')
r5 = Recipe.create(name: 'Meat lovers pizza', ingredients: 'Pizza base, Bbq sauce, Ham, Salami, Shredded chicken, Cheese, Bacon', instructions: 'Cook on high for 40min', image: 'https://www.simplyrecipes.com/thmb/DA5eU5XdNxu0LbVLGURzN_0S_1g=/720x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2019__09__easy-pepperoni-pizza-lead-5-51e2bcdb9afe48a19f5c7283c637a0a5.jpg')

puts ":total seeded recipes is #{ Recipe.count }"

puts 'users and recipes'

Comment.destroy_all
c1 = Comment.create(content: 'Wow that looks great!')
c2 = Comment.create(content: 'damn how good is that!')
c3 = Comment.create(content: 'Ewww rabit food!')
puts ":total seeded comments is #{ Comment.count }"


u1.recipes << r1
u2.recipes << r2
u3.recipes << r3
u1.recipes << r4
u1.recipes << r5


u1.comments << c1
r1.comments << c1

u2.comments << c2
r2.comments << c2

u3.comments << c3
r3.comments << c3