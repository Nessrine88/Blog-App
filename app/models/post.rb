class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :author, presence: true
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validtaes :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


  def update_post_counter
    user.update(posts_counter: user.posts.count)
  end

  def five_recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
