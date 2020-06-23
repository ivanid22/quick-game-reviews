class Like < ApplicationRecord
  belongs_to :user
  belongs_to :game_review
end
