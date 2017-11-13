class Post < ApplicationRecord

	validates :title, :article, :user_id, presence: true
	belongs_to :user
end
