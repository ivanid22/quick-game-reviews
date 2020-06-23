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
end
