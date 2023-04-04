class AdddogNameToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :dog_name, :string
  end
end
