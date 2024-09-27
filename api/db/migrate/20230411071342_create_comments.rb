class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :article_id
      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :article_id
  end
end
