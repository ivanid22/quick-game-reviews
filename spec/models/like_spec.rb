require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    User.create(Username: 'author', FullName: 'Review Author')
    GameReview.create(author: User.first, title: 'test title', Text: 'test text')
  end

  it('should fail to create a like when no user is provided') do
    new_like = Like.create(game_review: GameReview.first)
    expect(new_like.persisted?).to be(false)
  end

  it('should fail to create a like when no game_review is provided') do
    new_like = Like.create(user: User.first)
    expect(new_like.persisted?).to be(false)
  end

  it('should delete a Like when its user is deleted') do
    new_like = Like.create(user: User.first, game_review: GameReview.first)
    persisted_before_delete = new_like.persisted?
    User.first.destroy
    expect(persisted_before_delete && Like.all.empty?).to be(true) 
  end

  it('should delete a Like when its game_review is deleted') do
    new_like = Like.create(user: User.first, game_review: GameReview.first)
    persisted_before_delete = new_like.persisted?
    GameReview.first.destroy
    expect(persisted_before_delete && Like.all.empty?).to be(true) 
  end
end