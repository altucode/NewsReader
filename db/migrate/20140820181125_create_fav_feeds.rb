class CreateFavFeeds < ActiveRecord::Migration
  def change
    create_table :fav_feeds do |t|

      t.timestamps
    end
  end
end
