class Deck < ActiveRecord::Base
  validates :creator_id, presence:true
  validates :name, presence:true
  validates :personal, presence:true

  has_many :rounds
  belongs_to :users
end
