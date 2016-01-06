class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :like
      t.integer :browse_times
      t.integer :category_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
