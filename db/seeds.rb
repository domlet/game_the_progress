# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'

Category.delete_all
User.delete_all
Game.delete_all
Question.delete_all
Answer.delete_all
Result.delete_all

###############################
# SEQUENCE/ORDER IS IMPORTANT #
###############################

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

10.times do
Category.create!(
    name:Faker::Book.genre
  )
end

10.times do
Game.create!(
    title:Faker::StarWars.quote,
    subject:Faker::Book.genre
  )
end

10.times do
Question.create!(
    text:Faker::StarWars.quote,
    game_id:rand(1..10),
    category_id:rand(1..10)
  )
end

10.times do
Answer.create!(
    text:Faker::StarWars.quote,
    question_id:rand(1..10)
  )
end

10.times do
Result.create!(
    is_correct:Faker::Boolean.boolean(0.2),
    user_id:rand(1..10),
    question_id:rand(1..10),
    student_answer_id:rand(1..10),
  )
end
