FactoryGirl.define do
  factory :result do
    is_correct true
    # association :user
    association :question
  end
end