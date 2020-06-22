require 'rails_helper'

RSpec.describe Following, type: :model do
  before :each do
    User.create(Username: 'first', FullName: 'First User')
    User.create(Username: 'second', FullName: 'Second User')
  end

  it 'should fail to create a following when no follower is provided' do
    new_following = Following.new(followed: User.last)
    new_following.save
    expect(new_following.persisted?).to be(false)
  end

  it 'should fail to create a following when no followed is provided' do
    new_following = Following.new(follower: User.first)
    new_following.save
    expect(new_following.persisted?).to be(false)
  end

  it 'should create a Following when both follower and followed are provided' do
    new_following = Following.new(follower: User.first, followed: User.last)
    new_following.save
    expect(new_following.persisted?).to be(true)
  end

  it 'should delete the Followings when either the follower or the followed are deleted' do
    new_following = Following.create(follower: User.first, followed: User.last)
    persisted_before_deleting = new_following.persisted?
    User.first.destroy
    expect(persisted_before_deleting && Following.all.empty?).to be(true)
  end
end