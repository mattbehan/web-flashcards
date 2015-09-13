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
    { deck_name: self.deck.name,
      played_date: self.updated_at,
      cards_in_deck: self.guesses.select { |guess| guess.correct? }.length,
      first_tries: self.first_corrects,
      total_guesses: self.total_guesses,
      efficiency: ((self.first_corrects.fdiv(self.guesses.select { |guess| guess.correct? }.length)) * 100).round }
  end

  def first_corrects
    cards = []
    self.guesses.each { |guess| cards << guess.card_id }
    duplicates = cards.select { |card| cards.count(card) > 1 }
    cards.length - duplicates.length
  end

  def total_guesses
    self.guesses.length
  end

end

