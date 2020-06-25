class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.bigint :user_id, null: false
      t.bigint :game_review_id, null: false
      t.timestamps
    end
    add_foreign_key :likes, :users, column: :user_id, on_delete: :cascade
    add_foreign_key :likes, :game_reviews, column: :game_review_id, on_delete: :cascade
  end
end
