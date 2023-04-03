class ArticlesController < ApplicationController
  # Top画面
  def top
    
  end
  # 記事一覧
  def index
    @articles = Article.all
  end
  # 投稿画面
  def new
    @article = Article.new

  end
  # 投稿処理
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_index_path
    else
      render 'new'
    end
  end
  # 投稿詳細
  def show
    @article = Article.find(params[:id])
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
      :kind
    )
  end
end
