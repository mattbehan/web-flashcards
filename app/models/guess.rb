class Guess < ActiveRecord::Base
  validates :round_id, presence:true
  validates :card_id, presence:true

  belongs_to :card
  belongs_to :round

  def correct?
  	self.complete
  end

end
