require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most(250) }
  it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }
  describe '#update_post_counter' do
    it 'updates the posts_counter of the associated user' do
      user = create(:user)
      post = create(:post, user:)
      expect { post.update_post_counter }.to change { user.reload.posts_counter }.by(1)
    end
  end

  describe '#five_recent_comments' do
    it 'returns the five most recent comments for the post' do
      post = create(:post) # Assuming you have a factory for Post
      comments = create_list(:comment, 6, post:) # Assuming you have a factory for Comment
      five_recent_comments = post.five_recent_comments
      expect(five_recent_comments.length).to eq(5)
      expect(five_recent_comments).to include(comments[0], comments[1], comments[2], comments[3], comments[4])
      expect(five_recent_comments).not_to include(comments[5])
    end
  end
end
