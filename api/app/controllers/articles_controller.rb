class ArticlesController < ApplicationController
  # 記事一覧
  def index
    blogs = Blog.all
    render json: articles
  end
  # 記事詳細
  def show
    blog = Blog.find(params[:id])
    render json: article
  end
  # 記事作成
  def create
    Article.create(article_params)
    head :created
  end

  # ストロングパラメーター
  private

  def article_params
    params.require(:article).permit(
      :title,
      :contents
    )
  end
end
