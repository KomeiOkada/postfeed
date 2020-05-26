class CreateRichsitesummaries < ActiveRecord::Migration[5.2]
  def change
    create_table :richsitesummaries do |t|
      t.string :title
      t.text :rss_url
      t.text :source_url
      t.datetime :last_modified

      t.timestamps
    end
  end
end
