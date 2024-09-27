class AddageToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :age, :integer
    add_column :users, :sex, :string
    add_column :users, :live, :string
  end
end
