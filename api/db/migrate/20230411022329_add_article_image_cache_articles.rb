class AddArticleImageCacheArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :article_image_cache, :string
  end
end
