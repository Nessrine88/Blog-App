require 'rails_helper'

describe 'users show', type: :system do
  let(:user) { User.new(name: 'Diego', bio: 'Hi I\'m a student from Mexico', photo: 'https://as1.ftcdn.net/v2/jpg/00/64/30/06/1000_F_64300613_1TYCvyzq09Go7oEVXkDQypofuaJEwKTo.jpg') }
  let(:post1) { Post.new(user:, title: 'Post 1', text: 'Post content') }
  let(:post2) { Post.new(user:, title: 'Post 2', text: 'Post content') }
  let(:post3) { Post.new(user:, title: 'Post 3', text: 'Post content') }
  let(:post4) { Post.new(user:, title: 'Post 4', text: 'Post content') }
  let(:comment1) { Comment.new(user:, post: post1, text: 'Comment 1') }
  let(:comment2) { Comment.new(user:, post: post2, text: 'Comment 2') }
  let(:comment3) { Comment.new(user:, post: post3, text: 'Comment 3') }
  let!(:like1) { Like.create(user:, post: post1) }

  before :each do
    user.save
    post1.save
    post2.save
    post3.save
    post4.save
    comment1.save
    comment2.save
    comment3.save
  end

  it 'displays the profile picture for each user' do
    visit users_path(user)
    expect(page).to have_css('img.user-photo')
  end

  it 'can see the number of posts of the user' do
    visit "/users/#{user.id}"

    expect(page).to have_content("Number of posts: #{user.posts.count}")
  end

  it 'can see the bio of the user' do
    visit "/users/#{user.id}"
    expect(page).to have_content(user.bio)
  end

  it 'displays the user\'s 3 most recent posts' do
    visit "/users/#{user.id}"
    expect(page).to have_content(post2.text)
    expect(page).to have_content(post3.text)
    expect(page).to have_content(post4.text)
  end

  it 'can see a button to see all posts' do
    visit "/users/#{user.id}"
    expect(page).to have_content('See all posts')
  end

  it 'clicking an user redirects you to the user show page' do
    visit users_path
    click_link user.name
    expect(page).to have_current_path("/users/#{user.id}")
  end
end
