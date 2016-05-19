gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card_generator'
require_relative '../lib/card'
# require_relative '../trivia_questions.txt'
require_relative '../lib/deck'
require 'pry'

class CardGeneratorTest < Minitest::Test
  def test_card_generator_exists
    assert CardGenerator.new(nil)
  end

  def test_card_generator_loads_cards
    card_generator = CardGenerator.new("trivia_questions.txt")
    result = card_generator.cards
    assert_equal Array, result.class
    assert_equal Card, result.first.class
  end

  def test_card_generator_loads_answer
    card_generator = CardGenerator.new("trivia_questions.txt")
    all_cards = card_generator.cards
    assert_equal "GRAHAM'S NUMBER", all_cards.first.answer
  end

  def test_card_generator_questions_match_answer
    card_generator = CardGenerator.new("trivia_questions.txt")
    all_cards = card_generator.cards
    assert_equal "Pnigerophobia is the fear of what?" , all_cards[1].question
  end

  def test_can_deck_receive_cards_from_card_generator
    card_generator = CardGenerator.new("trivia_questions.txt")
    new_deck = Deck.new(card_generator.cards)
    assert_equal Array, new_deck.cards.class
    assert_equal 5, new_deck.cards.count
    assert_equal "GRAHAM'S NUMBER", new_deck.cards.first.answer
    assert_equal "Pnigerophobia is the fear of what?", new_deck.cards[1].question
  end
end
