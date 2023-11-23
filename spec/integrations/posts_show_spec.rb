require 'rails_helper'

describe 'posts show', type: :system do
  let(:user) { User.create(name: 'Tom', bio: 'Teacher from mexico', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') }
  let(:post1) { Post.create(user:, title: 'Post 1', text: 'Post content') }
  let(:comment1) { Comment.create(user:, post: post1, text: 'My_comment') }
  let(:like1) { Like.create(user:, post: post1) }
  let(:path) { "/users/#{user.id}/posts/#{post1.id}" }

  before :each do
    user.save
    post1.save
    comment1.save
    like1.save
  end

  it 'can see the post\'s title' do
    visit path
    expect(page).to have_content(post1.title)
  end

  it 'can see who wrote the post' do
    visit path
    expect(page).to have_content(user.name)
  end

  it 'can see how many comments it has' do
    visit path
    expect(page).to have_content("Comments: #{post1.comments.count}")
  end

  it 'can see how many likes it has' do
    visit path
    expect(page).to have_content("Likes: #{post1.likes.count}")
  end

  it 'can see the post body' do
    visit path
    expect(page).to have_content(post1.text)
  end

  it 'can see username of each commentor' do
    visit path
    expect(page).to have_content(comment1.user.name)
  end
end
