# frozen_string_literal: true
# Emoji class
class Emoji
  attr_reader :selected_set
  # Constant tih all the emoji sets
  LIST = {
    smiley:     ["😃 ", "😰 ", "😡 "],
    heart:      ["💚 ", "💙 ", "💔 "],
    smiley2:    ["😍 ", "😩 ", "😭 🔫 "],
    hand:       ["👍 ", "👋 ", "👎 "],
    moon:       ["🌝 ", "🌓 ", "🌚 "],
    buildings:  ["🏩 ", "🏫 ", "🏥 "],
    woman:      ["🙆 ", "🙋 ", "🙍 "],
    stock:      ["📈 ", "📊 ", "📉 "],
    monkey:     ["🙈 ", "🙉 ", "🙊 "],
    cats:       ["😸 ", "🙀 ", "😾 "],
    smell:      ["🌺 ", "👃 ", "💩 "],
    fruit:      ["🍏 ", "🍋 ", "🍎 "],
    speach:     ["💭 ", "💬 ", "🗯 "]
  }.freeze
  def initialize(emoji_spec)
    @selected_set = if !emoji_spec.nil? && LIST.key?(emoji_spec.to_sym)
      emoji_spec.to_sym
    else
      LIST.keys.sample
    end
  end

  def passed
    LIST[@selected_set][0]
  end

  def pending
    LIST[@selected_set][1]
  end

  def failed
    LIST[@selected_set][2]
  end

  def self.list
    LIST
  end
end
