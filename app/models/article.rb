class Article < ActiveRecord::Base
	
	has_many :article_comments
	has_many :article_likes
	belongs_to :category
	belongs_to :user
	
	def self.search(searchArticle)
	  where("title LIKE ?", "%#{searchArticle}%")
	end
	
end
