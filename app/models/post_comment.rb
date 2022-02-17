class PostComment < ApplicationRecord
  belongs_to :user # Comment.user で、コメント投稿者取得
  belongs_to :post_image
end
