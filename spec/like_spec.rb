require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_like_counter' do
    it 'updates the likes_counter of the associated post' do
      user = create(:user) # Assuming you have a factory for User
      post = create(:post, user:) # Assuming you have a factory for Post
      like = create(:like, user:, post:) # Assuming you have a factory for Like

      expect { like.update_like_counter }.to change { post.reload.likes_counter }.by(1)
    end
  end
end
