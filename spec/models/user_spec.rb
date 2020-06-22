require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    User.create(Username: 'first', FullName: 'First User')
    User.create(Username: 'second', FullName: 'Second User')
    User.create(Username: 'third', FullName: 'Third User')
  end

  it 'should fail to create a user with an invalid username' do
    user = User.new(Username: '##leading_symbols', FullName: 'FullName')
    user.save
    expect(user.persisted?).to be(false)
  end

  it 'should fail to create a user with an invalid full name' do
    user = User.new(Username: 'username', FullName: '###Leading symbols')
    user.save
    expect(user.persisted?).to be(false)
  end

  it 'should create a user with a valid username' do
    user = User.new(Username: 'username', FullName: 'username')
    user.save
    expect(user.persisted?).to be(true)
  end

  it 'should create a user with a valid full name' do
    user = User.new(Username: 'username', FullName: 'Full name')
    user.save
    expect(user.persisted?).to be(true)
  end

  it 'should fail to create two users with the same username' do
    User.create(Username: 'testuser', FullName: 'Test User')
    new_user = User.new(Username: 'testuser', FullName: 'Test User')
    new_user.save
    expect(new_user.persisted?).to be(false)
  end

  it 'should return all followable users' do
    new_user = User.create(Username: 'testuser', FullName: 'Test User')
    expect(new_user.followable.count).to eql(3)
  end

  it 'should return a list of followers of new_user' do
    new_user = User.create(Username: 'testuser', FullName: 'Test User')
    Following.create(follower: User.find_by(Username: 'first'), followed: new_user)
    Following.create(follower: User.find_by(Username: 'second'), followed: new_user)
    Following.create(follower: User.find_by(Username: 'third'), followed: new_user)
    expect(new_user.followed_by.count).to eql(3)
  end
end