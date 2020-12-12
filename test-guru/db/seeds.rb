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
    { category: 'Front' },
    { category: 'Back' },
    { category: 'DB' } 
  ]
)

tests = Test.create(
  [
    { title: "Test_1", level: 0, category_id: categories[0].id, author: users[0] },
    { title: "Test_2", level: 1, category_id: categories[1].id , author: users[0]},
    { title: "Test_3", level: 2, category_id: categories[2].id , author: users[0]}
  ]
)

questions = []
  5.times { |n| questions << Question.create(title: "Question_body_#{i}-#{n}", test_id: test.id) }

questions.each.with_index(1) do |question, i|
  5.times { |n| Answer.create(title:"Answer_#{i}-#{n}", question_id: question.id, correct: (n == 1)) }
end

users = User.create(
  [
    { first_name: "John", email: "gates@gmail.com" },
    { first_name: "Bill", email: "packard@gmail.com" },
    { first_name: "Steve", email: "work@gmail.com" }
  ]
)

answers = Answer.create(
  [
    {title: 'correct', question: questions[0], correct: true},
    {title: 'incorrect', question: questions[0], correct: false} 
  ]
)

10.times { TestHistory.create(user_id: users.sample.id, test_id: tests.sample.id, passed: [true, false].sample) }
