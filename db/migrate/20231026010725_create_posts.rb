class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.integer :comments_counter, default: 0
      t.integer :likes_counter, default: 0
      t.timestamps
    end

    add_index :posts, :author_id
  end
end