class User < ActiveRecord::Base

  has_many :rounds
  has_many :decks, foreign_key: :creator_id
  has_one :profile

  validates :username, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validate :valid_new_password

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @new_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def correct_password?(pwd)
    self.password == pwd
  end

  def valid_new_password
    if @new_password.length == nil
      self.errors.add(:password, "must not be nil")
    end
  end

  def rounds_sorted_by_deck
    sorted_rounds = {}
    self.rounds.each do |round|
      next unless round.finished?
      if sorted_rounds[round.deck.name]
        sorted_rounds[round.deck.name] << round
      else
        sorted_rounds[round.deck.name] = [round]
      end
    end
    sorted_rounds
  end



end
