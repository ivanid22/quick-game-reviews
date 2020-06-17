class GameReview < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "AuthorId"
end
