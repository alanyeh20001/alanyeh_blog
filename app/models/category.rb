class Category < ActiveRecord::Base
	
	has_many :article
	belongs_to :user
end
