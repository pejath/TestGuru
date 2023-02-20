# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(title: 'Category 1')

User.create!(username: 'name', email: 'user@mail.com', role: 'user')
admin = User.create(username: 'admin', email: 'admin@mail.com', role: 'admin')

tests = Test.create([{ title: 'title 1', level: 1, category_id: Category.first.id, author_id: admin.id },
                     { title: 'title 2', level: 2, category_id: Category.first.id, author_id: admin.id },
                     { title: 'title 3', level: 3, category_id: Category.first.id, author_id: admin.id }])

tests.each do |test|
  Result.create!(status: 'complete', test_id: test.id, user_id: admin.id)
  Question.create!([{ body: "test #{test.id} question 1", test_id: test.id },
                    { body: "test #{test.id} question 2", test_id: test.id },
                    { body: "test #{test.id} question 3", test_id: test.id }])
end

Question.all.each do |question|
  Answer.create!([{ body: "question #{question.id} answer 1", correct: true, question_id: question.id },
                  { body: "question #{question.id} answer 2", correct: false, question_id: question.id },
                  { body: "question #{question.id} answer 3", correct: false, question_id: question.id }])
end
