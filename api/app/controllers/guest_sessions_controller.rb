class GuestSessionsController < ApplicationController
  # ゲストログイン処理
	def create
		user = User.find_or_create_by(email: "guest@example.com") do |user|
			user.password = SecureRandom.urlsafe_base64
			user.name = "ゲストユーザー"
		end
			session[:user_id] = user.id
			flash[:notice] = "ゲストユーザーとしてログインしました。"
			redirect_to articles_index_path
	end
end
