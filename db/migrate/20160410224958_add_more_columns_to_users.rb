class AddMoreColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :nickname, :string, null: false
    add_index :users, :nickname, unique: true
    add_index :users, :first_name
    add_index :users, :last_name
    add_column :users, :image, :string
  end
end
