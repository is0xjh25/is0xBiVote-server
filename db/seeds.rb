# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_b = User.create(username: "is0xjh25", email: "is0.jimhsiao@gmail.com", password: "abcd1234")
user_a = User.create(username: "demo", email: "demo@gmail.com", password: "abcd1234")

vote_m = Vote.create(name: "Should human cloning be allowed?", category: "world", start_time: DateTime.new(2022, 1, 1), end_time: DateTime.new(2022, 1, 31), status: "closed")
vote_n = Vote.create(name: "Does Loch Ness Monster exist?", category: "mystery", start_time: DateTime.new(2022, 1, 1), end_time: DateTime.new(2022, 1, 31), status: "closed")
vote_k = Vote.create(name: "Should boxing be banned?", category: "sport", start_time: DateTime.new(2022, 1, 1), end_time: DateTime.new(2022, 1, 31), status: "closed")
vote_o = Vote.create(name: "Does Will Smith deserves an Oscar?", category: "entertainment", start_time: DateTime.new(2022, 1, 1), end_time: DateTime.new(2022, 1, 31), status: "closed")

vote_i = Vote.create(name: "Is gas going run out in our generation?", category: "world", start_time: DateTime.new(2022, 2, 1), end_time: DateTime.new(2022, 2, 28), status: "closed")
vote_j = Vote.create(name: "Will time travel happen?", category: "mystery", start_time: DateTime.new(2022, 2, 1), end_time: DateTime.new(2022, 2, 28), status: "closed")
vote_k = Vote.create(name: "Can Lakers go into playoff next year?", category: "sport", start_time: DateTime.new(2022, 2, 1), end_time: DateTime.new(2022, 2, 28), status: "closed")
vote_l = Vote.create(name: "Is Kevin Hart a good comedian?", category: "entertainment", start_time: DateTime.new(2022, 2, 1), end_time: DateTime.new(2022, 2, 28), status: "closed")

vote_e = Vote.create(name: "Is Donald Trump a fine leader?", category: "world", start_time: DateTime.new(2022, 3, 1), end_time: DateTime.new(2022, 3, 31), status: "closed")
vote_f = Vote.create(name: "Is chicken a kind of dinosaur?", category: "mystery", start_time: DateTime.new(2022, 3, 1), end_time: DateTime.new(2022, 3, 31), status: "closed")
vote_g = Vote.create(name: "Baseball or cricket?", category: "sport", start_time: DateTime.new(2022, 3, 1), end_time: DateTime.new(2022, 3, 31), status: "closed")
vote_h = Vote.create(name: "Did the Oscar judges get the winners right in 2022?", category: "entertainment", start_time: DateTime.new(2022, 3, 1), end_time: DateTime.new(2022, 3, 31), status: "closed")

vote_a = Vote.create(name: "Is nuclear energy the solution?", category: "world", start_time: DateTime.new(2022, 4, 1), end_time: DateTime.new(2022, 4, 30), status: "progressing")
vote_b = Vote.create(name: "Do aliens exist?", category: "mystery", start_time: DateTime.new(2022, 4, 1), end_time: DateTime.new(2022, 4, 30), status: "progressing")
vote_c = Vote.create(name: "Is Messi better than Ronaldo?", category: "sport", start_time: DateTime.new(2022, 4, 1), end_time: DateTime.new(2022, 4, 30), status: "progressing")
vote_d = Vote.create(name: "Are superhero movies sci-fi or fantasy?", category: "entertainment", start_time: DateTime.new(2022, 4, 1), end_time: DateTime.new(2022, 4, 30), status: "progressing")