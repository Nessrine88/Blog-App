require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_comment_counter' do
    it 'updates the comments_counter of the associated post' do
      user = create(:user) # Assuming you have a factory for User
      post = create(:post, user:) # Assuming you have a factory for Post
      comment = create(:comment, user:, post:) # Assuming you have a factory for Comment

      expect { comment.update_comment_counter }.to change { post.reload.comments_counter }.by(1)
    end
  end
end
