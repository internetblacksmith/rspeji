require "spec_helper"
require "emoji"

RSpec.describe Emoji do
  describe "#initialize" do
    it "selects a random set when no argument given" do
      emoji = Emoji.new(nil)
      expect(Emoji::LIST.keys).to include(emoji.selected_set)
    end

    it "uses the specified set when valid" do
      emoji = Emoji.new("cats")
      expect(emoji.selected_set).to eq(:cats)
    end

    it "falls back to random when set is invalid" do
      emoji = Emoji.new("nonexistent")
      expect(Emoji::LIST.keys).to include(emoji.selected_set)
    end
  end

  describe "#passed" do
    it "returns the first emoji in the set" do
      emoji = Emoji.new("smiley")
      expect(emoji.passed).to eq("😃 ")
    end
  end

  describe "#pending" do
    it "returns the second emoji in the set" do
      emoji = Emoji.new("smiley")
      expect(emoji.pending).to eq("😰 ")
    end
  end

  describe "#failed" do
    it "returns the third emoji in the set" do
      emoji = Emoji.new("smiley")
      expect(emoji.failed).to eq("😡 ")
    end
  end

  describe ".list" do
    it "returns the LIST constant" do
      expect(Emoji.list).to eq(Emoji::LIST)
    end

    it "is frozen" do
      expect(Emoji.list).to be_frozen
    end
  end
end
