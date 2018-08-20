class CreatePostsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :post_title
      t.string :post_content
      t.datetime :created_at
      t.datetime :updated_at
      t.references :user, index: true
    end
  end
end
