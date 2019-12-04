class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user
      t.integer :reviewer_id
      t.string :comments
      t.decimal :rate

      t.timestamps null: false
    end
  end
end
