# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


question1 = Question.create(title: 'Question 1', content: "This is the first question")
question2 = Question.create(title: 'Question 2', content: "This is the second question")

answer1 = Answer.create(title: 'Test1', content: 'Text answer content', question_id: Question.first.id)
answer2 = Answer.create(title: 'Test2', content: 'Text answer content', question_id: Question.first.id)
answer3 = Answer.create(title: 'Test3', content: 'Text answer content', question_id: Question.last.id)
answer4 = Answer.create(title: 'Test4', content: 'Text answer content', question_id: Question.last.id)
