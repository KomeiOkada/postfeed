class Richsitesummary < ApplicationRecord
  validates :source_url,  length: { maximum: 255 },
                          format: /\A#{URI::regexp(%w(http https))}\z/,
                          uniqueness: { case_sensitive: true }
  validates :rss_url, presence: true, length: { maximum: 255 },
                      format: /\A#{URI::regexp(%w(http https))}\z/,
                      uniqueness: { case_sensitive: true }
                     
  has_many :articles
  accepts_nested_attributes_for :articles

  has_many :follows
  has_many :followers, through: :follows, source: :user
  
end