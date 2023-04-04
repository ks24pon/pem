class Article < ApplicationRecord
	belongs_to :user
	# バリデーション
	validates :title, presence: true
	validates :body, presence: true
	validates :image, presence: true
	validates :kind, presence: true
	# 誰が投稿したか
	validates :user_id, presence: true
end
