class Game < ApplicationRecord
  has_many :questions
  # has_many :results, through: :questions
end
