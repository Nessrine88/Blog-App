require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(id: 7, name: 'Elo', posts_counter: 0) }

  subject { Post.new(author_id: user.id, title: 'Hello', text: 'first post', comments_counter: 0, likes_counter: 0) }
  before { subject.save }

  it 'should have a title' do
    subject.title = nil
    expect(subject).to be_invalid

    subject.title = 'Elo'
    expect(subject).to be_valid
  end

  it 'should not be too long' do
    subject.title = 'b' * 251
    expect(subject).to be_invalid
  end

  it 'comments_counter should be an integer greater than or equals to 0' do
    subject.comments_counter = nil
    expect(subject).to be_invalid

    subject.comments_counter = -1
    expect(subject).to be_invalid

    expect(subject.comments_counter).to be_integer

    subject.comments_counter = 3
    expect(subject).to be_valid
  end

  it 'likes_counter should be an integer greater than or equals to 0' do
    subject.likes_counter = nil
    expect(subject).to be_invalid

    subject.likes_counter = -1
    expect(subject).to be_invalid

    expect(subject.likes_counter).to be_integer

    subject.likes_counter = 3
    expect(subject).to be_valid
  end

  it 'five_recent_comments should return 5 recent comments' do
    user = User.create(id: 11, name: 'Elo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                       bio: 'Teacher from Congo', posts_counter: 0)

    Comment.create(id: 11, post_id: subject.id, user_id: user.id, text: 'comment 1')
    comment2 = Comment.create(id: 12, post_id: subject.id, user_id: user.id, text: 'comment 2')
    comment3 = Comment.create(id: 13, post_id: subject.id, user_id: user.id, text: 'comment 3')
    comment4 = Comment.create(id: 14, post_id: subject.id, user_id: user.id, text: 'comment 4')
    comment5 = Comment.create(id: 15, post_id: subject.id, user_id: user.id, text: 'comment 5')
    comment6 = Comment.create(id: 16, post_id: subject.id, user_id: user.id, text: 'comment 6')

    result = [comment6, comment5, comment4, comment3, comment2]

    expect(subject.five_recent_comments).to eq(result)
  end
end
