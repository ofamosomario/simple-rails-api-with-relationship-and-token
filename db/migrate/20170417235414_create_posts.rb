class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :message, limit: 140, null: false

      t.timestamps
    end
  end
end
