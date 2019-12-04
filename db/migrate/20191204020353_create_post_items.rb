class CreatePostItems < ActiveRecord::Migration[5.2]
  def change
    create_table :post_items do |t|
      t.references :post
      t.decimal :rate
      t.string :area

      t.timestamps null: false
    end
  end
end
