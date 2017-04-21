class AddUserIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :user_id, :integer
    add_foreign_key :posts, :users, column: :user_id, name: "fk_users_messages"
  end
end
