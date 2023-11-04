require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_like_counter' do
    it 'updates the likes_counter of the associated post' do
      user = create(:user)
      post = create(:post, user:)
      like = create(:like, user:, post:)

      expect { like.update_like_counter }.to change { post.reload.likes_counter }.by(1)
    end
  end
end
