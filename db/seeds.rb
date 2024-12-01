# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#   
# 
Comment.delete_all
Post.delete_all
User.delete_all

User.create(username: "John", email: 'john@doe.com', password: 'password', password_confirmation: 'password')
User.create(username: "Dean", email: 'dean@example.com', password: 'password', password_confirmation: 'password')

10.times do |idx|
  Post.create(title: "Title #{idx+1}", content: "Content for post #{idx} is this only.", user_id: User.first.id)
end

