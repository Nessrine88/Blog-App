require 'rails_helper'

describe 'users show', type: :system do
  let(:user) { User.create(name: 'Tom', bio: 'Teacher from mexico', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') }
  let(:post1) { Post.create(user:, title: 'Post 1', text: 'Post content') }
  let(:comment1) { Comment.create(user:, post: post1, text: 'My_comment') }
  let(:like1) { Like.create(user:, post: post1) }

  before :each do
    user.save
    post1.save
    comment1.save
    like1.save
  end

  it 'displays the profile picture for each user' do
    visit users_path
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

  it 'can see the user\'s  most recent posts' do
    visit "/users/#{user.id}/posts"
    expect(page).to have_content(post1.text)
  end

  it 'can see a button to see all posts' do
    visit "/users/#{user.id}"
    expect(page).to have_content('See all posts')
  end

  it 'clicking an user redirects you to the user show page' do
    visit "/users/#{user.id}/posts"

    click_link 'See this post'
    expect(page).to have_current_path("/users/#{post1.author_id}/posts/#{post1.id}")
  end
end
