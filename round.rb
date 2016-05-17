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
    if new_guess.response == @current_card.answer
      @number_correct += 1
    end
    @deck.cards.shift
    @current_card = @deck.cards.first
  end

  def percent_correct
    (@number_correct.to_f / @guesses.count) * 100
  end


end
