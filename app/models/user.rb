class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }

  after_initialize :set_defaults

  def set_defaults
    self.posts_counter = [posts.count, 0].max
  end

  def recent_posts
    posts.order('created_at DESC').limit(3)
  end
end
