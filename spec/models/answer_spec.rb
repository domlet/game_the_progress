require 'rails_helper'

describe Answer do
  let(:answer) { build(:answer) }
  let(:question) { build(:question) }

  context "text" do
    it "has a value" do
      expect(answer.text).to eq "42"
    end
  end

  context "associations" do
    it "has a question" do
      expect(answer.question.text).to eq "What is the meaning of life?"
    end
  end
end