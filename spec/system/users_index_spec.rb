require 'rails_helper'
describe 'user index', type: :system do
  let!(:user1) { User.create(name: 'Alice', bio: 'Writer', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') }
  it 'displays the username of all other users' do
    visit users_path
    expect(page).to have_content(user1.name)
  end

  it 'can see the profile picture of the user' do
    visit path

    photo = find(:css, '.user-photo')

    expect(photo).to_not be_nil
  end

  it 'displays the number of posts each user has written' do
    visit users_path
    expect(page).to have_content("Number of posts: #{user1.posts.count}")
  end

  it 'redirects to the user show page when clicking on a user' do
    visit users_path
    click_link user1.name
    expect(current_path).to eq("/users/#{user1.id}")
  end
end
