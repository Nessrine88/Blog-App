require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:posts_counter).only_integer.is_greater_than_or_equal_to(0) }

  describe '#recent_posts' do
    it 'returns the 3 most recent posts for the user' do
      user = create(:user) # Assuming you have a factory for User
      posts = create_list(:post, 4, user:) # Assuming you have a factory for Post

      recent_posts = user.recent_posts

      expect(recent_posts.length).to eq(3)
      expect(recent_posts).to eq([posts[3], posts[2], posts[1]])
      expect(recent_posts).not_to include(posts[0])
    end
  end
end
