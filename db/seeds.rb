# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Admin.all.empty?
  admin = Admin.new(first_name: 'Name', last_name: 'Surname', username: 'admin', email: 'admin@mail.com',
                    password: 'qwerty12')
  admin.skip_confirmation!
  admin.save!

  Category.create!(title: 'Category 1')
  Category.create!(title: 'Category 2')
  Category.create!(title: 'Category 3')

  tests = Test.create([{ title: 'title 1', level: 1, category_id: rand(1..Category.count), description: "desc 1", author: admin },
                       { title: 'title 2', level: 2, category_id: rand(1..Category.count), description: "desc 2", author: admin },
                       { title: 'title 3', level: 3, category_id: rand(1..Category.count), description: "desc 3", author: admin }])

  tests.each do |test|
    Question.create!([{ body: "test #{test.id} question 1", test: },
                      { body: "test #{test.id} question 2", test: },
                      { body: "test #{test.id} question 3", test: }])
  end

  22.times do |i|
    Question.create!( body: "test #{tests[0].id} question #{i+4}", test: tests[0])
  end

  Question.all.each do |question|
    Answer.create!([{ body: "question #{question.id} answer 1", correct: true, question: },
                    { body: "question #{question.id} answer 2", correct: false, question: },
                    { body: "question #{question.id} answer 3", correct: false, question: }])
  end
end
Badge.create!([{ name: 'badge 1 category', rule_type: 'category', rule_option: '1' },
               { name: 'badge 2 first', rule_type: 'first_try' },
               { name: 'badge 3 level 2', rule_type: 'level', rule_option: '2' }])
