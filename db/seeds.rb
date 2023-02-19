# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Category.create(title: 'Category 1')

User.create(username: 'name', email: 'user@mail.com', role: 'user')
admin = User.create(username: 'admin', email: 'admin@mail.com', role: 'admin')

3.times do |i|
  test = Test.create(title: "title #{i}", level: rand(1..3), category_id: Category.first.id, author_id: admin.id)
  5.times do |j|
    question = Question.create(body: "test #{i} question #{j}", test_id: test.id)
    Answer.create(body: "test #{i} answer #{j}", correct: [true, false].sample, question_id: question.id)
  end
end
