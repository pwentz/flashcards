require 'pry'

class Round
  attr_accessor  :deck,
                 :guesses,
                 :current_card,
                 :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card = deck.cards.first
    @number_correct = 0
  end

  def record_guess(guess)
    new_guess = Guess.new(guess, @current_card)
    @guesses.push(new_guess)
    if new_guess.response == @current_card.answer.upcase
      @number_correct += 1
      #EXTENSION: user gets answer correct, card go poof
      @deck.cards.shift
      #EXTENSION: else statement below signals incorrect card to go to the end of the deck
      puts new_guess.feedback
      puts new_guess.card.answer
    else
      @deck.cards.rotate!
      puts new_guess.feedback
    end
    @current_card = @deck.cards.first
  end

  def percent_correct
    (@number_correct.to_f / @guesses.count).round(2) * 100
  end

  def write_file
    pooled_answers = @guesses.map do |guess|
      "ANSWER: " + guess.card.answer + "\n"*2
    end

    pooled_feedback = @guesses.map do |guess|
      "STATUS: " + guess.feedback
    end

    pooled_responses = @guesses.map do |guess|
      "YOUR ANSWER: " + guess.response
    end

    pooled_questions = @guesses.map do |guess|
      "QUESTION: " + guess.card.question
    end

    filename = Time.now.strftime("results-%Y-%m-%d-%l:%M%P")+".txt"
    File.open(filename, "w") do |file_writer|
      file_writer.puts pooled_questions.zip(pooled_responses, pooled_feedback, pooled_answers)
      file_writer.puts "********** USE THESE RESULTS TO TRACK YOUR IMPROVEMENT! ************" + "\n"*2
      file_writer.puts "You had #{number_correct} correct guesses out of #{guesses.count} for a score of #{percent_correct}%!" + "\n"*2
      if percent_correct < 100
        file_writer.puts "Not bad, but you still have room for improvement!"
      else
        file_writer.puts "PERFECT SCORE! Time to crank up the intensity, ya think?"
      end
    end


  end

end
