require 'rails_helper'

describe 'posts index', type: :system do
  let(:user) { User.create(name: 'Tom', bio: 'Teacher from mexico', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') }
  let(:post1) { Post.create(user:, title: 'Post 1', text: 'Post content') }
  let(:comment1) { Comment.create(user:, post: post1, text: 'My_comment') }
  let(:like1) { Like.create(user:, post: post1) }
  let(:path) { "/users/#{user.id}/posts" }

  before :each do
    user.save
    post1.save
    comment1.save
    like1.save
  end

  it 'can see the profile picture of the user' do
    visit "/users/#{user.id}"
    photo = find(:css, '.user-photo')
    expect(photo).to_not be_nil
  end

  it 'can see the username' do
    visit path
    puts user.name
    find(:css, '.user-photo')

    expect(page).to have_content(user.name)
  end

  it 'can see number of posts of the user' do
    visit path
    puts user.posts_counter
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
  end

  it 'can see a post\'s title' do
    visit path
    expect(page).to have_content(post1.title)
  end

  it 'can see the post\'s body' do
    visit path
    expect(page).to have_content(post1.text)
  end

  it 'clicking an user redirects you to the user show page' do
    visit "/users/#{user.id}/posts"
    first(:link, 'See this post').click
    expect(page).to have_current_path("/users/#{user.id}/posts/#{Post.first.id}")
  end

  it 'can see how many comments a post has' do
    visit path
    expect(page).to have_content("Comments: #{post1.comments.count}")
  end

  it 'can see how many likes a post has' do
    visit path
    expect(page).to have_content("Likes: #{post1.likes.count}")
  end

  it 'redirects to the post page when clicking a post' do
    visit path
    click_link 'See this post'
    expect(page).to have_current_path("/users/#{user.id}/posts/#{post1.id}")
  end
end
