class Deck < ActiveRecord::Base
  validates :name, presence:true

  has_many :rounds
  has_many :cards
  belongs_to :creator, class_name: :User

  def total_cards
  	self.cards.length
  end

end
