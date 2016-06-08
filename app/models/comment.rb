class Comment < ActiveRecord::Base
  belongs_to :post
  validates :post, presence: true
  validates :body, presence: { message: "field can't be empty!" }
end
