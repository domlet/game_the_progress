class Question < ApplicationRecord
  belongs_to :game
  has_many :results
  # belongs_to :correct_answer_id, class_name: "Answer", foreign_key: "correct_answer_id"
end

