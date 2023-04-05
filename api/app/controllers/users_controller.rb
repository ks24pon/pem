class UsersController < ApplicationController

    # ユーザー一覧
    def index

    end
    # ユーザー登録画面
    def new
			@user = User.new
    end
    #  登録処理
    def create
			@user = User.new(user_params)
			if @user.save
				flash[:success] = '新しいユーザーを登録しました'
				redirect_to articles_index_path
			else
				flash[:danger] = 'ユーザー登録に失敗しました'
				render :new
			end
    end
    # ユーザー詳細
    def show
			@user = User.find(params[:id])
    end
    # ユーザー編集
    def edit
			@user = User.find(params[:id])
    end
    # 編集処理
    def update
			@user = User.find(params[:id])
			# ログイン中のユーザーであるか
			if current_user == @user
				if @user.update
					flash[:success] = 'ユーザーを編集しました'
					redirect_to users_edit_path
				else
					flash[:danger] = 'ユーザー編集に失敗しました'
					render :new
				end
			else
				redirect_to articles_edit_path
			end
    end

		# ストロングパラメーター
		private

		def user_params
			params.require(:user).permit(
				:name,
				:email,
				:age,
				:sex,
				:live,
				:password
			)
		end
end
