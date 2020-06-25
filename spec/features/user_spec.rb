require 'rails_helper'
require 'capybara/rspec'

describe 'user authentication', type: :feature do
  before :each do
    User.create(Username: 'testuser', FullName: 'Test User')
  end

  it 'should sign the user in' do
    visit '/sign_in'
    within('#sign-in-form') do
      fill_in 'Username', with: 'testuser'
    end
    click_button 'Sign in'
    expect(page).to have_content 'You are now logged in'
  end

  it 'should fail to sign in an inexistent user' do
    visit '/sign_in'
    within('#sign-in-form') do
      fill_in 'Username', with: 'nonexistent'
    end
    click_button 'Sign in'
    expect(page).to have_content 'User not found'
  end
end

describe 'user creation', type: :feature do
  it 'should create a user' do
    visit '/users/new'
    within('#new_user') do
      fill_in 'Username', with: 'username'
      fill_in 'Full Name', with: 'User Name'
    end
    click_button 'Sign up'
    expect(page).to have_content 'User successfully created'
  end

  it 'should fail to create a user when the username field is empty' do
    visit '/users/new'
    within('#new_user') do
      fill_in 'Full Name', with: 'User Name'
    end
    click_button 'Sign up'
    expect(page).to have_content 'Username can\'t be blank'
  end

  it 'should fail to create a user when the full name field is empty' do
    visit '/users/new'
    within('#new_user') do
      fill_in 'Username', with: 'username'
    end
    click_button 'Sign up'
    expect(page).to have_content 'Fullname can\'t be blank'
  end
end
