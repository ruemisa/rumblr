class CreateCommentsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :username
      t.string :comment_body
      t.datetime :create_at
      t.datetime :updated_at
      t.references :post, :user, index: true
    end
  end
end
