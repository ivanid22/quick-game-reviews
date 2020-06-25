require 'rails_helper'

RSpec.describe GameReview, type: :model do
  before :each do
    User.create(Username: 'author', FullName: 'Review Author')
  end

  it 'should fail to create a GameReview when no author is provided' do
    review = GameReview.new(title: 'title', Text: 'review text')
    review.save
    expect(review.persisted?).to be(false)
  end

  it 'should fail to create a GameReview with an empty title' do
    review = GameReview.new(title: '', Text: 'Review text', author: User.first)
    review.save
    expect(review.persisted?).to be(false)
  end

  it 'should fail to create a GameReview with an empty Text field' do
    review = GameReview.new(title: 'title', Text: '', author: User.first)
    review.save
    expect(review.persisted?).to be(false)
  end

  it 'should return the review\'s author' do
    review = GameReview.create(author: User.first, title: 'test', Text: 'test')
    expect(review.author).to eql(User.first)
  end

  it 'should return the correct number of likes for a game_review' do
    review = GameReview.create(author: User.first, title: 'test title', Text: 'test text')
    User.create(Username: 'second', FullName: 'second user')
    User.create(Username: 'third', FullName: 'third user')
    Like.create(user: User.find_by(Username: 'second'), game_review: review)
    Like.create(user: User.find_by(Username: 'third'), game_review: review)
    expect(review.likes.count).to eql(2)
  end
end
