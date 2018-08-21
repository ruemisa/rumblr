class CreatePostsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :post_title
      t.string :post_content
      t.string :post_category
      t.string :author
      t.datetime :created_at
      t.datetime :updated_at
      t.references :user, foreign_key: true
    end
  end
end


