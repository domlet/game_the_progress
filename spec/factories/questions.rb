require 'rails_helper'

describe Question do
  let(:question) { build(:question) }
  let(:game) { build(:game) }

  context "is_correct" do
    it "has a value" do
      expect(question.text).to eq "What is the meaning of life?"
    end
  end
end