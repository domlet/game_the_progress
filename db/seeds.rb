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

# User.create!(
#     first_name:"Shenesha",
#     last_name:"Martinez",
#     username:'studentuser',
#     email:'student@devbootcamp.com',
#     password:'123456',
#     is_admin: false
#   )

# 10.times do
# User.create!(
#     first_name:Faker::GameOfThrones.character,
#     last_name:Faker::GameOfThrones.house,
#     username:Faker::Internet.user_name,
#     email:Faker::Internet.email,
#     password:Faker::Internet.password,
#     is_admin: true
#   )
# end

# 5.times do
# Category.create!(
#     name:Faker::Book.genre
#   )
# end

# # This triple-nested loop creates:
#   # 5 Games
#   # 10 Questions in each Game
#   # 4 Answers for each Question
# 20.times do |x|
#   Game.create!(
#       title:Faker::StarWars.quote,
#       subject:Faker::Book.genre
#     )
#   10.times do |y|
#     Question.create!(
#         text:Faker::StarWars.quote[0..-2].concat("?"),
#         game_id: x + 1,
#         category_id: rand(1..5)
#       )
#     4.times do
#       Answer.create!(
#           text:Faker::StarWars.quote,
#           question_id: (10 * x) + (y + 1)
#         )
#     end
#     temp_question_variable = Question.find(y+1)
#     temp_question_variable.correct_answer_id = (y*4) + 1
#     temp_question_variable.save
#   end
# end



# 10.times do |x|
# Question.create!(
#     text:Faker::StarWars.quote,
#     game_id: x + 2, # skip game 1 (to avoid weirdness)
#     category_id: x + 1
#   )
# end

# 10.times do |x|
# Answer.create!(
#     text:Faker::StarWars.quote,
#     question_id: x + 11 # avoid 5 answers for first 10 questions
#   )
# end

# 10.times do |x|
# Result.create!(
#     is_correct: [true, false].sample,
#     user_id:x + 1,
#     question_id:x + 1,
#     student_answer_id:x + 1,
#   )
# end


###################### SEEDS FOR DEMO ############################################
# Creates 1 Admin User, 10 Student Users, 1 Game with 10 Questions, 4 Answers each
########### to use, comment out lines 17-65 ######################################
  User.create!(
      first_name:"Jim",
      last_name:"Lengel",
      username:'jlengel',
      email:'jlengel@devbootcamp.com',
      password:'123456',
      is_admin: true
    )

  10.times do
      User.create!(
          first_name:Faker::GameOfThrones.character,
          last_name:Faker::GameOfThrones.house,
          username:Faker::Internet.user_name,
          email:Faker::Internet.email,
          password:Faker::Internet.password,
          is_admin: false
        )
      end

  Category.create!(
      name: "Community"
    )

  Game.create!(
        title: "DBC Trivia",
        subject: "Coding Bootcamp"
      )

  question_sample =  ["Who is most likely to be carrying bacon?",
          "What is something you should never do around Jenny?",
          "Who wears shirt garters?",
          "Who is most likely to get married at burning man?",
          "What are programmers most likely to say to avoid explaining something?",
          "Who is most likely to buy hand sanitizer in bulk?",
          "Who is most likely to impersonate Buffy the Vampire Slayer?",
          "Who is most likely to take all your money in poker?",
          "Which final project team is most likely to find siren sounds obligatory?",
          "Which of these has the highest value?"
          ]

  answer_sample = [
                  ["Ken", "Hunter", "Sarah", "Max" ],
                  [ "Whistle", "Hum", "Chew gum", "Sing" ],
                  [ "Shambhavi", "Hunter", "Sarah", "Max" ],
                  [ "Andrew", "Max", "Seba", "Sarah" ],
                  [ "Algorithm", "Asynchrous", "Decoupled Architecture", "Polymorphic Association" ],
                  [ "Ken", "Walker", "Sarah", "Jenny" ],
                  [ "Shambhavi", "Seba", "Sarah", "Max" ],
                  [ "Jenny", "Walker", "Sarah", "Max" ],
                  [ "Game the Progress", "Tie-In", "The Partner", "All of the above" ],
                  [ "DBC", "NaN", "nil", "undefined" ]
                ]

  10.times do |y|
      Question.create!(
          text:question_sample[y],
          game_id: 1,
          category_id: 1
        )
    4.times do |x|
      Answer.create!(
          text:answer_sample[y][x],
          question_id: (y + 1)
          )
    end
    temp_question_variable = Question.find(y + 1)
    temp_question_variable.correct_answer_id = (y * 4) + 1
    temp_question_variable.save
  end


