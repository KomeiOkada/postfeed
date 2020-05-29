class ArticlesController < ApplicationController
  def create
    Richsitesummary.all.each do |richsitesummary|
      xml= HTTParty.get(richsitesummary.rss_url).body
      rss = Feedjira.parse(xml)

      puts richsitesummary.rss_url
      rss.entries.each do |item|
        article = richsitesummary.articles.where(title: item.title).first_or_initialize
        
        #local_article.update_attributes(rss_id: item.id, title: item.title, url: item.url, author: item.author, summary: item.summary, published: item.published)
        article.rss_id =  item.id
        article.title = item.title
        article.url = item.url
        article.author = item.author
        article.summary = item.summary
        article.published = item.published
        article.save
      end
    end
  end
end
