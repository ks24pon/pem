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
      logger.debug(@article.inspect)
      logger.debug("======================")
      redirect_to articles_index_path
    else
      render 'new'
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
