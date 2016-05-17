require_relative 'flashcards'
require_relative 'guess'
require_relative 'deck'
require_relative 'round'
# require_relative 'flashcard_runner'
require 'pry'


class CardGenerator
  def initialize(file)
    @file = file
    # @cards = load_deck
  end

  def load_deck
    #change method name to cards?
    #if cardGen must assume deck attr,
    #new_deck = Deck.new(CardGenerator.new(filename)) will give you that
    imported_deck = File.readlines(@file).map do |line|
      line.chomp.split(",")
    end
    imported_deck.map do |line|
      Card.new(line[0],line[1])
    end
  end
end
