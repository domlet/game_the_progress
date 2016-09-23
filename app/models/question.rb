class Question < ApplicationRecord
  belongs_to :game
  has_many :results
end

