class Comment < ApplicationRecord
		# コメントの所有者を取得
    belongs_to :user
		# コメントがされた投稿を取得
    belongs_to :article
end
