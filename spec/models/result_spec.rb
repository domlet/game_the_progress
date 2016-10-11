require 'rails_helper'

describe Result do
  let(:result) { build(:result) }

  context "is_correct" do
    it "has a boolean value" do
      expect(result.is_correct).to eq true
    end
  end

  context "associations" do
    it "has a question" do
      expect(result.question.text).to eq "What is the meaning of life?"
    end
  end
end