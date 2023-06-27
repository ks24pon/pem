module SessionsHelper
	# 渡されたユーザーでログイン
	def log_in(user)
		session[:user_id] = user.id
	end

	# 現在ログイン中のユーザー
	def current_user
		if session[:user_id]
			@current_user = @current_user || User.find_by(id: session[:user_id]) 
		end
	end

	# 受け取ったユーザーがログイン中のユーザーか？一致すればtrue
	def current_user?(user)
		user == current_user
	end

	# ログインしていればtrue,その他ならfalse
	def logged_in?
		!current_user.nil?
	end

	# 現在のユーザーをログアウト
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end
end
