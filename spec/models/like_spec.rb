require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'should have valid user, post and update likes_counter in post object' do
    user = User.create(id: 13, name: 'Bruno', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                       bio: 'Teacher from Congo', posts_counter: 0)
    post = Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                       likes_counter: 0)
    like = Like.create(post:, user:)

    expect(like).to be_valid
    expect(post.likes_counter).to eq(1)
  end
end
