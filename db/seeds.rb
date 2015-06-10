# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(firstname: 'John', lastname: 'Doe', email: 'john.doe@example.com', password: 'dontknow',
  password_confirmation: 'dontknow', image_id: 'eaywz1u3boxdk5ujwiau', admin: true)

cary = User.create(firstname: 'Cary', lastname: 'Adkins', email: 'cary.adkins@example.com', password: 'dontknow',
  password_confirmation: 'dontknow')

essie = User.create(firstname: 'Essie', lastname: 'Foster', email: 'essie.foster@example.com', password: 'dontknow',
  password_confirmation: 'dontknow')

ron = User.create(firstname: 'Ron', lastname: 'Jones', email: 'ron.jones@example.com', password: 'dontknow',
  password_confirmation: 'dontknow')

kay = User.create(firstname: 'Kay', lastname: 'Holt', email: 'kay.holt@example.com', password: 'dontknow',
  password_confirmation: 'dontknow')

kristin = User.create(firstname: 'Kristin', lastname: 'Page', email: 'kristin.page@example.com', password: 'dontknow',
  password_confirmation: 'dontknow')

books = Category.create(name: 'Books')

product_1 = Product.create(title: 'Wolves Of Tomorrow', description: 'It is a great story about Wolves.', price: 15, 
    category: books, user_id: cary.id)
product_2 = Product.create(title: 'Vision Of Twilight', description: 'This story treats about apocalypse', price: 13, 
    category: books, user: essie)

review_1 = Review.create(content: 'Great story!', rating: 5, user: ron, product: product_1)
review_2 = Review.create(content: 'Very laaazy. I don\'t recommend.', rating: 2, user: kay, product: product_1)

review_3 = Review.create(content: 'It is very good item for gift.', rating: 4, user: kristin, product: product_2)
review_4 = Review.create(content: "It's really good!", rating: 5, user: essie, product: product_2)