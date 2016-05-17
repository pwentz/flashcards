require_relative 'flashcards'
require_relative 'guess'
require_relative 'deck'
require_relative 'round'
# require_relative 'flashcard_runner'
require 'pry'


def get_cards_from(file)
  File.readlines(file).map do |line|
  line.chomp.split(",")
  end
end
# binding.pry
