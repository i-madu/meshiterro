class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments,dependent: :destroy
  has_many :favorites,dependent: :destroy
  
  validates :shop_name,presence:true
  validates :image,presence:true
  

  def favorited_by?(user) #いいねしたユーザー情報を取得
    favorites.exists?(user_id:user_id) 
    #上記で受け渡されたIDが
    #user_idカラム（Favoritesテーブル）内に存在（exists?）してるか調べる
  end


  def get_image
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      image.attach(io:File.open(file_path),filename:"default-image.jpg",content_type:"image/ipeg")
    end
      image
  end

end
