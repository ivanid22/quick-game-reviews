class CreateGameReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :game_reviews do |t|
      t.bigint :AuthorId, null: false
      t.text :Text
      t.timestamps
    end
    add_foreign_key :game_reviews, :users, column: :AuthorId
  end
end
