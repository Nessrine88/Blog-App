class AddIndexToPosts < ActiveRecord::Migration[7.1]
  def change
    add_index :posts, :author_id
  end
end
