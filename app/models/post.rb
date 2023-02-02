class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: :post_id, dependent: :delete_all
  has_many :likes, foreign_key: :post_id, dependent: :delete_all

  validates :title, presence: true, length: { minimum: 3, maximum: 250 }

  after_save :update_post_counter

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
