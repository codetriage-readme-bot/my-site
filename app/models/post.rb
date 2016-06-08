class Post < ActiveRecord::Base
  has_many :comments
  validates :title, :body, presence: true
  validates :title, length: {
    minimum: 10,
    maximum: 100,
    too_short: "title must have at least %{count} characters",
    too_long: "title must have at most %{count} characters"
  }
end
