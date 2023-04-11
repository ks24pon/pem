class CommentsController < ApplicationController
  # コメント実装
	def create
		# 投稿idを取得
		article = Article.find(params[:article_id])
		# ログインユーザーのコメントオブジェクトを生成
		@comment = current_user.comments.new(comment_params)
		# コメントオブジェクトに投稿IDを定義
		@comment.article_id = article.id
		# 保存
		@comment.save
		# 保存成功後に記事詳細画面に遷移(引数は記事IDがつく)
		redirect_to articles_show_path(article)
	end

	# コメント削除
	def destroy
		Comment.find_by(id: params[:id], article_id: params[:article_id]).destroy
		redirect_to articles_show_path(params[:article_id])
	end

	# ストロングパラメーター
	private
		def comment_params
			params.require(:comment).permit(
				:comment
			)
		end
end
