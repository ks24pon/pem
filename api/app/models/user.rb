class User < ApplicationRecord
  has_secure_password
	has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  # 紐付け
  has_many :likes
  #likesテーブルにarticle_idが存在するか
  def liked_by?(article_id)
    # likeモデルからいいねが存在するかどうか
    likes.where(article_id: article_id).exists?
  end
end