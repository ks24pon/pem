class Article < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	mount_uploader :image, ImageUploader
	# バリデーション
	validates :title, presence: true
	validates :body, presence: true
	validates :image, presence: true
	validates :kind, presence: true
	validates :image, presence: true
	# 誰が投稿したか
	validates :user_id, presence: true
end
