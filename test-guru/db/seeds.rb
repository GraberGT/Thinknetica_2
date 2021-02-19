# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Test.destroy_all
Category.destroy_all
Question.destroy_all
Answer.destroy_all
User.destroy_all

categories = Category.create(
  [
    { title: 'Front' },
    { title: 'Back' },
    { title: 'DB' } 
  ]
)

users = User.create(
  [
    { name: "John", email: "gates@gmail.com" },
    { name: "Bill", email: "packard@gmail.com" },
    { name: "Steve", email: "work@gmail.com" }
  ]
)

tests = Test.create(
  [
    { title: "Test_1", level: 0, category_id: categories[0].id, author: users[0] },
    { title: "Test_2", level: 1, category_id: categories[1].id , author: users[0]},
    { title: "Test_3", level: 2, category_id: categories[2].id , author: users[0]}
  ]
)


questions = Question.create(
  [
    {title: "Front question 1", test: tests[0]},
    {title: "Back question 1", test: tests[1]},
    {title: "DB question 1", test: tests[2]}
  ]
)

answers = Answer.create(
  [
    {title: 'correct', question: questions[0], right_answer: true},
    {title: 'incorrect', question: questions[0], right_answer: false} 
  ]
)

10.times { TestHistory.create(user_id: users.sample.id, test_id: tests.sample.id, passed: [true, false].sample) }
