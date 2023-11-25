require 'rails_helper'

RSpec.describe 'User display', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @recent_post = @user.three_recent_posts
  end

  it 'displays the profile picture for a user' do
    visit "users/#{@user.id}"
    expect(page).to have_selector('.profile-picture img')
  end
  

  it 'displays the user bio' do
    visit "users/#{@user.id}"
    expect(page).to have_content(@user.bio)
  end

  it 'displays the user\'s recent posts' do
    visit "users/#{@user.id}"
    @recent_post.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
    end
  end
  

  it 'displays a button to see all posts' do
    visit "users/#{@user.id}"
    expect(page).to have_selector('.see_all')
  end

  it 'redirects to the user show page when clicking on the user' do
    visit "/users"
    click_link(@user.name)
    expect(page).to have_current_path("/users/#{@user.id}")
  end
end