require_relative 'card'
require_relative 'guess'
# require_relative '../trivia_questions.txt'
require_relative 'deck'
require 'pry'


class CardGenerator
  def initialize(file)
    @file = file
  end

  def cards
    #change method name to cards?
    #if cardGen must assume deck attr,
    #new_deck = Deck.new(CardGenerator.new(filename)) will give you that
    imported_deck = File.readlines(@file).map do |line|
      # binding.pry
      line.chomp.split(",")
    end
    # binding.pry
    imported_deck.map do |line|
      Card.new(line[0],line[1])
    end
  end
end
