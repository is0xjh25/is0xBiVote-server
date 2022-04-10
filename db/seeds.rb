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

# vote_record_1 = VoteRecord.create(user_id: user_a.id, vote_id: vote_a.id, vote_one: "yes", vote_two: "no", status: "vote_two");
# vote_record_2 = VoteRecord.create(user_id: user_a.id, vote_id: vote_b.id, vote_one: "no", vote_two: "no", status: "vote_two");
# vote_record_3 = VoteRecord.create(user_id: user_a.id, vote_id: vote_c.id, vote_one: "no", vote_two: "yes", status: "vote_two");
# vote_record_4 = VoteRecord.create(user_id: user_a.id, vote_id: vote_d.id, vote_one: "yes", vote_two: "no", status: "vote_two");
# vote_record_5 = VoteRecord.create(user_id: user_b.id, vote_id: vote_a.id, vote_one: "yes", vote_two: "no", status: "vote_two");
# vote_record_6 = VoteRecord.create(user_id: user_b.id, vote_id: vote_b.id, vote_one: "yes", vote_two: "yes", status: "vote_two");
# vote_record_7 = VoteRecord.create(user_id: user_b.id, vote_id: vote_c.id, vote_one: "yes", vote_two: "yes", status: "vote_two");
# vote_record_8 = VoteRecord.create(user_id: user_b.id, vote_id: vote_d.id, vote_one: "yes", vote_two: "yes", status: "vote_two");
# vote_record_9 = VoteRecord.create(user_id: user_c.id, vote_id: vote_a.id, vote_one: "yes", vote_two: "yes", status: "vote_two");
# vote_record_10 = VoteRecord.create(user_id: user_c.id, vote_id: vote_b.id, vote_one: "no", vote_two: "yes", status: "vote_two");
# vote_record_11 = VoteRecord.create(user_id: user_c.id, vote_id: vote_c.id, vote_one: "not_interested", vote_two: "not_interested", status: "vote_two");
# vote_record_12 = VoteRecord.create(user_id: user_c.id, vote_id: vote_d.id, vote_one: "not_interested", vote_two: "not_interested", status: "vote_two");
# vote_record_13 = VoteRecord.create(user_id: user_d.id, vote_id: vote_a.id, vote_one: "no_opinion", vote_two: "no", status: "vote_two");
# vote_record_14 = VoteRecord.create(user_id: user_d.id, vote_id: vote_b.id, vote_one: "no_opinion", vote_two: "no", status: "vote_two");
# vote_record_15 = VoteRecord.create(user_id: user_d.id, vote_id: vote_c.id, vote_one: "no_opinion", vote_two: "no", status: "vote_two");
# vote_record_16 = VoteRecord.create(user_id: user_d.id, vote_id: vote_d.id, vote_one: "no_opinion", vote_two: "no", status: "vote_two");
