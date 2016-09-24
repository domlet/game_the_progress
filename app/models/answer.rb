class Answer < ApplicationRecord
  belongs_to :question
  has_many :results, foreign_key: "student_answer_id"
  # has_one :question, foreign_key: "correct_answer_id"
end
