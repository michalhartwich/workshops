# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(firstname: 'John', lastname: 'Doe', email: 'john.doe@example.com', password: 'dontknow',
  password_confirmation: 'dontknow', image_id: 'eaywz1u3boxdk5ujwiau', admin: true)

User.create(firstname: 'Cary', lastname: 'Adkins', email: 'cary.adkins@example.com', password: 'dontknow',
  password_confirmation: 'dontknow')

User.create(firstname: 'Essie', lastname: 'Foster', email: 'essie.foster@example.com', password: 'dontknow',
  password_confirmation: 'dontknow')

User.create(firstname: 'Ron', lastname: 'Jones', email: 'ron.jones@example.com', password: 'dontknow',
  password_confirmation: 'dontknow')

User.create(firstame: 'Kay', lastname: 'Holt', email: 'kay.holt@example.com', password: 'dontknow',
  password_confirmation: 'dontknow')