class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|

      t.integer :follower_id
      t.integer :followed_id
      t.integer :status, default: 0, null: false

      t.timestamps
    end
	    add_foreign_key :relationships, :users, column: :follower_id, name: "fk_followers_user"
	    add_foreign_key :relationships, :users, column: :followed_id, name: "fk_followed_following"    
  end
end
