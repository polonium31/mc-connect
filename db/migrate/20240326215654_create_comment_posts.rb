class CreateCommentPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :comment_posts do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
