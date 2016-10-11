require 'rails_helper'

describe Answer do
  let(:answer) { build(:answer) }

  context "text" do
    it "has a value" do
      expect(answer.text).to eq "42"
    end
  end
end