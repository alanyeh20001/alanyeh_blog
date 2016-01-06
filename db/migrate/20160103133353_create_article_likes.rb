class CreateArticleLikes < ActiveRecord::Migration
  def change
    create_table :article_likes do |t|
      t.integer :user_id
      t.integer :article_id
    end
  end
end
