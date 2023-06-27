class LikesController < ApplicationController
	# いいね機能
	def create
		@article_like = Like.new(user_id: current_user.id, article_id: params[:article_id])
		@article_like.save
		redirect_to articles_index_path
	end

	# いいね解除
	def destroy
		@article_like = Like.find_by(user_id: current_user.id, article_id: params[:article_id]).destroy
		logger.debug(@article_like.inspect)
		logger.debug('===========================')
		redirect_to articles_index_path
	end
end