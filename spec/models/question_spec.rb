FactoryGirl.define do
  factory :question do
    text "What is the meaning of life?"
    association :game
    # association :correct_answer
  end
end