class ArticlesController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]
  # Top画面
  def top
  end
  # 記事一覧
  def index
    @articles = Article.all
    @user = User.find_by(params[:id])
  end
  # 投稿画面
  def new
    @article = Article.new
    # @articles = Artice.all
  end
  # 投稿処理
  def create
    @article = Article.new(article_params)
    # 誰が投稿したか指定
    # @article.user_id = current_user.id
    if @article.save
      redirect_to articles_index_path
    else
      render 'new'
    end
  end
  # 投稿詳細
  def show
    @article = Article.find_by(params[:id])
    @user = User.find_by(id: @article.user_id)
  end

  # 編集処理
  def edit
    @article = Article.find(params[:id])
  end

  # 編集処理
  def update
    @article = Article.find(params[:id])
    if @article.update
      redirect_to articles_index_path
    else
      render 'edit'
    end
  end

  # 削除機能
  def destroy
    @article = Article.find(params[:id])
    if @article.delete
      redirect_to articles_index_path
    end
  end
  # ストロングパラメーター
  private

  def article_params
    params.require(:article).permit(
      :title,
      :body,
      :image,
      :kind,
      :dog_name
    ).merge(
      :user_id
    )
  end
end
