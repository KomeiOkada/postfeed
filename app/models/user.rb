class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :relationships
  has_many :followings, through: :relationships, source: :richsitesummary
  
  def follow(rss)
    self.relationships.find_or_create_by(richsitesummary_id: rss.id)
  end

  def unfollow(rss)
    relationship = self.relationships.find_by(richsitesummary_id: rss.id)
    relationship.destroy if relationship
  end

  def following?(rss)
    self.followings.include?(rss)
  end
  
end