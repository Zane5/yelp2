# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

restaurants = Category.create(name: "Restaurants")
foods = Category.create(name: "foods")

pizzahut = Business.create(name: "Pizza Hut",
                          description: "Big Pizza",
                          picture_url: "/images/pizza-166-236.png",
                          category: restaurants
                          )

heycookie = Business.create(name: "Hey, Cookie",
                           description: "wonderful cookies",
                           picture_url: "/images/japanese-food-166-236.png",
                           category: foods
                           )

tim = User.create(username: "Tim",
                 password: "password",
                 email: "Tim@example.com"
                 )

mac = User.create(username: "Mac",
                 password: "password",
                 email: "mac@example.com"
                 )


Review.create(user: tim, business: pizzahut, description: "delicious pizza")
Review.create(user: tim, business: heycookie, description: "fantastic cookie")
Review.create(user: mac, business: pizzahut, description: "delicious hut ~~~~~~~!!!")
Review.create(user: mac, business: heycookie, description: "fantastic cookies ~~~~~~~~~~~!!!")
