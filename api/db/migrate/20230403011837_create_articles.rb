class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :image
      t.string :kind
      t.timestamps
    end
  end
end
