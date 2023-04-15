class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :daycare
  has_many :post_comments, dependent: :destroy
end
