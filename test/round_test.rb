gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card'
require_relative '../lib/guess'
require_relative '../lib/deck'
require_relative '../lib/round'

class RoundTest < Minitest::Test
  def test_round
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.deck
    assert_equal [], round.guesses
    round.current_card
    round.record_guess("Juneau")
    assert_equal 1, round.guesses.count
    assert_equal "Correct!", round.guesses.first.feedback
    assert_equal 1, round.number_correct
    round.current_card
    round.record_guess("2")
    assert_equal 2, round.guesses.count
    assert_equal "Incorrect.", round.guesses.last.feedback
    assert_equal 1, round.number_correct
    assert_equal 50, round.percent_correct
  end
end
