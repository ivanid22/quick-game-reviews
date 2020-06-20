class GameReview < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "AuthorId"

  validates :Text, presence: true
  validates :title, presence: true
  
end
