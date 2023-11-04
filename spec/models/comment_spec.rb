require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should have valid user, post and update comments_counter in post object' do
    user = User.create(id: 13, name: 'Elo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                       bio: 'Computer Eng', posts_counter: 0)
    post = Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                       likes_counter: 0)
    comment = Comment.create(post:, user:, text: 'Hi Elo!')

    expect(comment).to be_valid
    expect(post.comments_counter).to eq(1)
  end
end
