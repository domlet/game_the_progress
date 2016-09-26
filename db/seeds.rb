# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

###############################
# SEQUENCE/ORDER IS IMPORTANT #
###############################

#**********************************************
# SEED GROUP 1 (FOR ACTION-CABLE-TESTING)
#**********************************************
require 'faker'

Category.delete_all
User.delete_all
Game.delete_all
Question.delete_all
Answer.delete_all
Result.delete_all

# One student user id = 1
User.create!(
    first_name:"Shenesha",
    last_name:"Martinez",
    username:'studentuser',
    email:'student@devbootcamp.com',
    password:'123456',
    is_admin: false
  )

# 10 admin users, for no particular reason- enjoy
10.times do
User.create!(
    first_name:Faker::GameOfThrones.character,
    last_name:Faker::GameOfThrones.house,
    username:Faker::Internet.user_name,
    email:Faker::Internet.email,
    password:Faker::Internet.password,
    is_admin: true
  )
end

# Cannot create questions without category
10.times do
Category.create!(
    name:Faker::Book.genre
  )
end

# You must create games before questions because
  # each question is associated with a game
20.times do
Game.create!(
    title:Faker::StarWars.quote,
    subject:Faker::Book.genre
  )
end

# TEST GAME - QUESTIONS FOR GAME 1
10.times do |x|
Question.create!(
    text:Faker::StarWars.quote,
    game_id: 1,
    category_id: x + 1
  )
end

# TEST GAME - ANSWERS
10.times do |x|
Answer.create!(
    text:Faker::StarWars.quote,
    question_id: (x % 4) + 1
  )
end

# Start at index 0 on x
10.times do |x|
Question.create!(
    text:Faker::StarWars.quote,
    game_id: x + 2, # skip game 1 so that game 1 has 10 questions only
    category_id: x + 1
  )
end


10.times do |x|
Answer.create!(
    text:Faker::StarWars.quote,
    question_id: x + 11 # avoid 5 answers for first 10 questions
  )
end

# Associates first 10 questions with game 1
10.times do |x|
Result.create!(
    is_correct: [true, false].sample,
    user_id:x + 1,
    question_id:x + 1,
    student_answer_id:x + 1,
  )
end

#*****************************************************
# SEED GROUP 2 (FOR D3 TESTING)
  # COMMENT OUT LINES 21-97 TO SEED DB WITH THIS DATA
#*****************************************************

# creates 1 student users
User.create!(
    first_name:"Shenesha",
    last_name:"Martinez",
    username:'studentuser',
    email:'student@devbootcamp.com',
    password:'123456',
    is_admin: false
  )

# creates one teacher admin user
User.create!(
    first_name:Faker::GameOfThrones.character,
    last_name:Faker::GameOfThrones.house,
    username:Faker::Internet.user_name,
    email:Faker::Internet.email,
    password:Faker::Internet.password,
    is_admin: true
  )

# creates 1 category for all questions in game 1
Category.create!(
    name:Faker::Book.genre
  )

# creates a single game
Game.create!(
    title:Faker::StarWars.quote,
    subject:Faker::Book.genre,
    grade_level: 7
  )

# creates 5 questions for a single game 1
5.times do |x|
Question.create!(
    text:Faker::StarWars.quote,
    game_id: 1,
    category_id: 1,
    correct_answer_id: 1
  )
end

# creates 4 answers for question 1
4.times do |x|
Answer.create!(
    text:Faker::StarWars.quote,
    question_id: 1,
  )
end

# creates 4 answers for question 2
4.times do |x|
Answer.create!(
    text:Faker::StarWars.quote,
    question_id: 2,
  )
end

# creates 4 answers for question 3
4.times do |x|
Answer.create!(
    text:Faker::StarWars.quote,
    question_id: 3,
  )
end

# creates 4 answers for question 4
4.times do |x|
Answer.create!(
    text:Faker::StarWars.quote,
    question_id: 4,
  )
end

# creates 4 answers for question 5
4.times do |x|
Answer.create!(
    text:Faker::StarWars.quote,
    question_id: 5,
  )
end

# creates results for game 1, question 1, user 1
Result.create!(
    is_correct: true,
    user_id: 1,
    question_id: 1,
    student_answer_id: 1
  )

# creates results for game 1, question 2, user 1
Result.create!(
    is_correct: false,
    user_id: 1,
    question_id: 2,
    student_answer_id: 1
  )

# creates results for game 1, question 3, user 1
Result.create!(
    is_correct: false,
    user_id: 1,
    question_id: 3,
    student_answer_id: 1
  )

# creates results for game 1, question 4, user 1
Result.create!(
    is_correct: true,
    user_id: 1,
    question_id: 4,
    student_answer_id: 4
  )

# creates results for game 1, question 5, user 1
Result.create!(
    is_correct: false,
    user_id: 1,
    question_id: 5,
    student_answer_id: 4
  )









