class GameReview < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'AuthorId'
  has_many :likes

  validates :Text, presence: true, length: { minimum: 1 }
  validates :title, presence: true, length: { minimum: 1 }
end
