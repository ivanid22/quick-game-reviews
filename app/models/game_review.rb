class GameReview < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "AuthorId"
  has_many :likes

  validates :Text, presence: true
  validates :title, presence: true
  
end
