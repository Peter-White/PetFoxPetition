class AddMoreColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :nickname, :string, null: false
    add_index :users, :nickname, unique: true
    add_column :users, :image, :string
  end
end
