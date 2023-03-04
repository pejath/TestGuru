# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(title: 'Category 1')

User.create!(username: 'name', email: 'user@mail.com', role: 'user', password: 'qwerty12')
admin = User.create(username: 'admin', email: 'admin@mail.com', role: 'admin', password: 'qwerty12')

tests = Test.create([{ title: 'title 1', level: 1, category: Category.first, author: admin },
                     { title: 'title 2', level: 2, category: Category.first, author: admin },
                     { title: 'title 3', level: 3, category: Category.first, author: admin }])

tests.each do |test|
  Question.create!([{ body: "test #{test.id} question 1", test: },
                    { body: "test #{test.id} question 2", test: },
                    { body: "test #{test.id} question 3", test: }])
  TestPassage.create!(correct_questions: 0, test:, user: admin)
end

Question.all.each do |question|
  Answer.create!([{ body: "question #{question.id} answer 1", correct: true, question: },
                  { body: "question #{question.id} answer 2", correct: false, question: },
                  { body: "question #{question.id} answer 3", correct: false, question: }])
end
