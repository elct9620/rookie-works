class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :user, foreign_key: true
      t.string :thumbnail
      t.integer :category, null: false, default: 0
      t.integer :status, null: false, default: 0

      t.datetime :published_at
      t.timestamps
    end

    add_index :posts, :title
    add_index :posts, [:user_id, :category, :status]
  end
end
