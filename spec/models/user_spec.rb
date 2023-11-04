require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(id: 10, name: 'Bruno', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Congo', posts_counter: 0) }
  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to be_invalid
    subject.name = 'bruno'
    expect(subject).to be_valid
  end

  it 'posts_counter should be an integer greater than or equals to 0' do
    subject.posts_counter = nil
    expect(subject).to be_invalid

    subject.posts_counter = -1
    expect(subject).to be_invalid

    expect(subject.posts_counter).to be_integer

    subject.posts_counter = 3
    expect(subject).to be_valid
  end

  it 'three_recent_posts should return 3 recent posts' do
    Post.create(id: 10, author_id: subject.id, title: 'Hello', text: 'This is my first post',
                comments_counter: 0, likes_counter: 0)
    post2 = Post.create(id: 11, author_id: subject.id, title: 'Hello', text: 'This is my second post',
                        comments_counter: 0, likes_counter: 0)
    post3 = Post.create(id: 12, author_id: subject.id, title: 'Hello', text: 'This is my third post',
                        comments_counter: 0, likes_counter: 0)
    post4 = Post.create(id: 13, author_id: subject.id, title: 'Hello', text: 'This is my third post',
                        comments_counter: 0, likes_counter: 0)

    result = [post4, post3, post2]

    expect(subject.three_recent_posts).to eq(result)
  end
end
