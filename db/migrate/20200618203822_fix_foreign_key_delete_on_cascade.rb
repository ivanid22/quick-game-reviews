class FixForeignKeyDeleteOnCascade < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :game_reviews, :users, column: :AuthorId
    add_foreign_key :game_reviews, :users, column: :AuthorId, on_delete: :cascade
  end
end
