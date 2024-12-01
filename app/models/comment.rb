class Comment < ApplicationRecord
  validates :body, presence: true, length: {minimum: 2}
  belongs_to :post
  belongs_to :user
end
