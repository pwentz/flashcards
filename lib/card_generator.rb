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
    imported_deck = File.readlines(@file).map do |line|
      line.chomp.split(",")
    end
    imported_deck.map do |line|
      Card.new(line[0],line[1])
    end
  end
end
