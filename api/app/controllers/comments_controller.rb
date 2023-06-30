class CommentsController < ApplicationController
	# コメント実装
	def create
		# 投稿idを取得
		@article = Article.find(params[:article_id])
		# ログインユーザーのコメントオブジェクトを生成
		@comment = @article.comments.build(comment_params)
		# コメントオブジェクトに投稿IDを定義
		@comment.user_id = current_user.id
		# 保存
		if @comment.save
			# 保存成功後に記事詳細画面に遷移
			redirect_to request.referer
		else
			render request.referer
		end
	end

	# コメント削除
	def destroy
		@article = Article.find(params[:article_id])
		@comment = Comment.find(params[:id])
		if @comment.destroy
			redirect_to request.referer
		end
	end

	# ストロングパラメーター
	private
		def comment_params
			params.require(:comment).permit(:comment, :user_id)
		end
end
