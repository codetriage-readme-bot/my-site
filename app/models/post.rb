class Post < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :body, presence: true

  validates :title, uniqueness: {
    message: "You can't have two posts with the same title."
  }

  def content_html
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(body)
  end
end
