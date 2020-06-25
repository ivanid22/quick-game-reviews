class Following < ApplicationRecord
  belongs_to :follower, class_name: 'User', foreign_key: 'FollowerId'
  belongs_to :followed, class_name: 'User', foreign_key: 'FollowedId'
end
