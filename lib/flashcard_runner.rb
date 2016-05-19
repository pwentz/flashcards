require_relative './card'
require_relative './guess'
require_relative './deck'
require_relative './round'
require_relative './card_generator/'

new_deck = Deck.new(CardGenerator.new("trivia_questions.txt").cards)
new_round = Round.new(new_deck)


def start(round)
  puts "\n"*2
  puts "Welcome! You're playing with #{round.guesses.count + round.deck.cards.count} cards."
  puts "-------------------------------------"
  until round.deck.cards.empty?
  puts "This is card number #{round.number_correct + 1} out of #{round.deck.cards.count + round.number_correct}." + "\n"*2
  print "Question: #{round.current_card.question} "
  input = gets.chomp.upcase
  round.record_guess(input)
  puts "\n"
  end
  puts "****** Game over! ******" + "\n"*2
  round.write_file
  puts "Your progress has been saved! Please check your working directory!" + "\n"*2
  puts "You had #{round.number_correct} correct guesses out of #{round.guesses.count} for a score of #{round.percent_correct}%!" + "\n"*2
  if round.percent_correct == 100
    puts "PERFECT SCORE!" + "\n"*2
  end
end

start(new_round)
