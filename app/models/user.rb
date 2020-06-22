class User < ApplicationRecord
  VALID_USERNAME_REGEX = /\A[A-z]+\z/
  VALID_FULL_NAME_REGEX = /\A([A-z]+[A-z ]+)+\z/

  has_one_attached :avatar
  has_one_attached :cover_picture

  has_many :game_reviews, class_name: "GameReview", foreign_key: "AuthorId"

  has_many :outgoing_followings, class_name: "Following", foreign_key: "FollowerId"
  has_many :incoming_followings, class_name: "Following", foreign_key: "FollowedId"

  has_many :followers, class_name: "User", through: :incoming_followings, foreign_key: "FollowedId"
  has_many :followed, class_name: "User", through: :outgoing_followings, foreign_key: "FollowerId"

  validates :Username, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 15}, format: { with: VALID_USERNAME_REGEX }
  validates :FullName, presence: true, length: {maximum: 50}, format: { with: VALID_FULL_NAME_REGEX }
  
  def followable
    User.all.select do |u|
      (u != self) && (!self.followed.include? u)
    end
  end

  def followed_by
    User.all.includes(:followed).select do |u|
      u.followed.include? self
    end
  end

end
