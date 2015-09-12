class Round < ActiveRecord::Base
  validates :user_id, presence:true
  validates :deck_id, presence:true

  belongs_to :deck
  belongs_to :user
  has_many :guesses

end

