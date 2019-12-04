class CreatePostsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :posts_categories do |t|
      t.references :post
      t.references :category

      t.timestamps null: false
    end
  end
end
