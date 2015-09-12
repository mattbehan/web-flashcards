class Round < ActiveRecord::Base
  validates :user_id, presence:true
  validates :deck_id, presence:true

  belongs_to :deck
  belongs_to :user
  has_many :guesses

  def finished?
    self.deck.total_cards == self.guesses.select { |guess| guess.correct? }.length
  end

  def cards_guessed
    correct_cards = []
    self.guesses.each { |guess| correct_cards << guess.card if guess.correct? }
    correct_cards
  end

  def unguessed_cards
    self.deck.cards - self.cards_guessed
  end

  def next_card
    self.unguessed_cards.sample
  end

  def stats
    { round_name: self.deck.name,
      first_tries: self.first_corrects,
      total_guesses: self.total_guesses }
  end

  def first_corrects
    duplicates = self.guesses.select { |guess| guesses.count(guess) > 1 }
    self.total_guesses - duplicates.length
  end

  def total_guesses
    self.guesses.length
  end

end

