class Comment < ApplicationRecord
  belongs_to :post

  validates :comment_text, presence:true
  validates :title, presence:true
end
