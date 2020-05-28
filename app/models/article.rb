class Article < ApplicationRecord
  belongs_to :richsitesummary
  accepts_nested_attributes_for :richsitesummary
  
  validates :rss_id,  uniqueness: true, presence: true
  validates :title, uniqueness: true, presence: true
  validates :published, presence: true
  validates :url, presence: true, length: { maximum: 255 },
            format: /\A#{URI::regexp(%w(http https))}\z/,
            uniqueness: { case_sensitive: true }
end
