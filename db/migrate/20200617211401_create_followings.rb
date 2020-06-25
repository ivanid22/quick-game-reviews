class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.bigint :FollowerId, null: false
      t.bigint :FollowedId, null: false
      t.timestamps
    end
    add_foreign_key :followings, :users, column: :FollowerId
    add_foreign_key :followings, :users, column: :FollowedId
  end
end
