class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :follows
  has_many :followings, through: :follows, source: :richsitesummary
  
  def follow(rss)
    self.follows.find_or_create_by(richsitesummary_id: rss.id)
  end

  def unfollow(rss)
    follow = self.follows.find_by(richsitesummary_id: rss.id)
    follow.destroy if follow
  end

  def following?(rss)
    self.followings.include?(rss)
  end
  
  def feed_rss
    Article.where(Richsitesummary_id: self.following_ids)
  end
end