class Post < ApplicationRecord
	belongs_to :user

	validates :title, presence: true
	validates :body, presence: true

	def content_html
		Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(body)
	end
end
