class Deck < ActiveRecord::Base
  validates :creator_id, presence:true
  validates :name, presence:true

  has_many :rounds
  belongs_to :creator, class_name: :User
end
