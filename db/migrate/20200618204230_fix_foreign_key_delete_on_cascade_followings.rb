class FixForeignKeyDeleteOnCascadeFollowings < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :followings, :users, column: :FollowerId
    remove_foreign_key :followings, :users, column: :FollowedId
    add_foreign_key :followings, :users, column: :FollowerId, on_delete: :cascade
    add_foreign_key :followings, :users, column: :FollowedId, on_delete: :cascade
  end
end
