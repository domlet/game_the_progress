require 'rails_helper'

describe Result do
  let(:result) { build(:result) }

  context "is_correct" do
    it "has a boolean value" do
      expect(result.is_correct).to eq true
    end
  end
end