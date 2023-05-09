class User < ApplicationRecord
  has_secure_password
	has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  # 紐付け
  has_many :likes
  # ニックネーム
  validates :name, presence: true
  # メールアドレス(大文字/小文字の区別をしない)
  validates :email, presence: true, uniqueness: { case_sensitive: false }
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
end