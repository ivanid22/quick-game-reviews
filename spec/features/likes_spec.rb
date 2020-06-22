require 'rails_helper'
require 'capybara/rspec'

describe "game review creation", type: :feature do
  before :each do
    User.create(Username: 'testuser', FullName: 'Test User')
    GameReview.create(title: 'test title', Text: 'test body', author: User.first)
    visit '/sign_in'
    within("#sign-in-form") do
      fill_in 'Username', with: 'testuser'
    end
    click_button 'Sign in'
  end

  it "should display the correct number of likes for a new post" do
    visit '/home'
    expect(page).to have_content('0 likes')
  end

  it "should like a post and update the count" do
    visit '/home'
    find_link(class: ['like-button']).click
    expect(page).to have_content('1 likes')
  end
  
end