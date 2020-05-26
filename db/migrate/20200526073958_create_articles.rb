class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.references :richsitesummary, foreign_key: true
      t.string :rss_id
      t.text :title
      t.text :url
      t.string :author
      t.text :summary
      t.datetime :published

      t.timestamps
    end
  end
end
