class Richsitesummary < ApplicationRecord
  validates :source_url,  presence: true, length: { maximum: 255 },
                          format: /\A#{URI::regexp(%w(http https))}\z/,
                          uniqueness: { case_sensitive: false }
  validates :rss_url, presence: true, length: { maximum: 255 },
                      format: /\A#{URI::regexp(%w(http https))}\z/,
                      uniqueness: { case_sensitive: false }
end
