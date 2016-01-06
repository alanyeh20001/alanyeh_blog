class CreateArticleComments < ActiveRecord::Migration
  def change
    create_table :article_comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :article_id

      t.timestamps null: false
    end
  end
end
