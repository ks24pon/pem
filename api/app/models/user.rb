class User < ApplicationRecord
  has_secure_password
	has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  # 紐付け
  has_many :likes
  # バリデーション
  # ニックネーム
  validates :name, presence: true
  # メールアドレス
  validates :email, presence: true
  # 年齢
  validates :age, presence: true
  # 性別
  validates :sex, presence: true
  # 地域
  validates :live, presence: true
  # パスワード inで8~32文字内
  validates :password, length: { in: 8..32 }
  # パスワード(再確認)
  validates :password_confirmation, presence: true
  #likesテーブルにarticle_idが存在するか
  def liked_by?(article_id)
    # likeモデルからいいねが存在するかどうか
    likes.where(article_id: article_id).exists?
  end
end