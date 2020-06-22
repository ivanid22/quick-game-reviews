require 'rails_helper'
require 'capybara/rspec'

describe "game review creation", type: :feature do
  before :each do
    User.create(Username: 'testuser', FullName: 'Test User')
    visit '/sign_in'
    within("#sign-in-form") do
      fill_in 'Username', with: 'testuser'
    end
    click_button 'Sign in'
  end

  it 'should create a game review' do
    visit '/home'
    within('#new_game_review') do
      fill_in "Title",	with: "test title"
      fill_in "Body",	with: "game review body"
    end
    click_button "Create Game review"
    expect(page).to have_content('Game Review successfully created') 
  end

  it 'should fail to create a game review when the title is missing' do
    visit '/home'
    within('#new_game_review') do
      fill_in "Body",	with: "game review body"
    end
    click_button "Create Game review"
    expect(page).to have_content('Error creating review. Please fill in both fields')
  end

  it 'should fail to create a game review when the body is missing' do
    visit '/home'
    within('#new_game_review') do
      fill_in "Title",	with: "test title"
    end
    click_button "Create Game review"
    expect(page).to have_content('Error creating review. Please fill in both fields')
  end
end