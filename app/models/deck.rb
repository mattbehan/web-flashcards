class Deck < ActiveRecord::Base
  validates :creator_id, presence:true
  validates :name, presence:true

  has_many :rounds
  has_many :cards
  belongs_to :creator, class_name: :User

  def total_cards
  	self.cards.length
  end
  
end
