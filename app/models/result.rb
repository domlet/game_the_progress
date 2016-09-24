class Result < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :student_answer, class_name: "Answer", foreign_key: "student_answer_id"
  # belongs_to :game, through: :questions
end
