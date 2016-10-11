FactoryGirl.define do
  factory :answer do
    text "42"
    association :question
  end
end