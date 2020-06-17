class User < ApplicationRecord
  has_many :game_reviews, class_name: "GameReview", foreign_key: "AuthorId"

  has_many :outgoing_followings, class_name: "Following", foreign_key: "FollowerId"
  has_many :incoming_followings, class_name: "Following", foreign_key: "FollowedId"

  has_many :followers, class_name: "User", through: :incoming_followings, foreign_key: "FollowedId"
  has_many :followed, class_name: "User", through: :outgoing_followings, foreign_key: "FollowerId"
end
