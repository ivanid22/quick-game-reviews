class AddTitleGameReview < ActiveRecord::Migration[6.0]
  def change
    add_column :game_reviews, :title, :string, null: false
  end
end
