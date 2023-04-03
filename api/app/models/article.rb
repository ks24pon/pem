class Article < ApplicationRecord
	# バリデーション
	validates :title, presence: true
	validates :body, presence: true
	validates :image, presence: true
	validates :kind, presence: true
end
