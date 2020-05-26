class Article < ApplicationRecord
  belongs_to :richsitesummary
  
  validates :rss_id, presence: true
  validates :title, presence: true
  validates :url, presence: true, length: { maximum: 255 },
            format: /\A#{URI::regexp(%w(http https))}\z/,
            uniqueness: { case_sensitive: true }
end
