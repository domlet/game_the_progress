require 'rails_helper'

describe Result do
  let(:game) { build(:game) }

  context "title" do
    it "has a value" do
      expect(game.title).to eq "Plant morphology"
    end
  end

  context "subject" do
    it "has a value" do
      expect(game.subject).to eq "Botany"
    end
  end
end