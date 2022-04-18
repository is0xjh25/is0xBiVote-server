# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_a = User.create(username: "demo", email: "demo@gmail.com", password: "demo")
user_b = User.create(username: "is0xjh25", email: "is0xjh25@gmail.com", password: "demo")
user_c = User.create(username: "jim", email: "jim@gmail.com", password: "demo")
user_d = User.create(username: "harry", email: "harry@gmail.com", password: "demo")

vote_a = Vote.create(name: "Is nuclear energy the solution?", category: "world", start_time: DateTime.new(2022, 1, 1), end_time: DateTime.new(2022, 12, 31), status: "progressing")
vote_b = Vote.create(name: "Do aliens exist?", category: "mystery", start_time: DateTime.new(2022, 1, 1), end_time: DateTime.new(2022, 12, 31), status: "progressing")
vote_c = Vote.create(name: "Who is better Messi or Ronaldo?", category: "sport", start_time: DateTime.new(2022, 1, 1), end_time: DateTime.new(2022, 12, 31), status: "progressing")
vote_d = Vote.create(name: "Are superhero movies sci-fi or fantasy?", category: "entertainment", start_time: DateTime.new(2022, 1, 1), end_time: DateTime.new(2022, 12, 31), status: "progressing")
vote_e = Vote.create(name: "Is Donald Trump a good leader?", category: "world", start_time: DateTime.new(2022, 1, 1), end_time: DateTime.new(2021, 6, 1), status: "closed")
vote_f = Vote.create(name: "Is chicken a kind of dinosaur?", category: "mystery", start_time: DateTime.new(2021, 6, 1), end_time: DateTime.new(2022, 12, 31), status: "closed")
vote_g = Vote.create(name: "Baseball or cricket?", category: "sport", start_time: DateTime.new(2021, 6, 1), end_time: DateTime.new(2022, 12, 31), status: "closed")
vote_h = Vote.create(name: "Did the Oscar judges get the winners right in 2020?", category: "entertainment", start_time: DateTime.new(2021, 6, 1), end_time: DateTime.new(2022, 12, 31), status: "closed")
vote_i = Vote.create(name: "Is gas going run out in our generation?", category: "world", start_time: DateTime.new(2022, 4, 1), end_time: DateTime.new(2022, 12, 31), status: "closed")
vote_j = Vote.create(name: "Will time travel happen?", category: "mystery", start_time: DateTime.new(2022, 4, 1), end_time: DateTime.new(2022, 12, 31), status: "closed")
vote_k = Vote.create(name: "Can Lakers go into playoff next year?", category: "sport", start_time: DateTime.new(2022, 4, 1), end_time: DateTime.new(2022, 12, 31), status: "closed")
vote_l = Vote.create(name: "Is Kevin Hart a good comedian?", category: "entertainment", start_time: DateTime.new(2022, 4, 1), end_time: DateTime.new(2022, 12, 31), status: "closed")
