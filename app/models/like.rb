class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_post_likes_count

  def update_post_likes_count
    post.update(:likes_count, post.likes.all.length)
  end
end
