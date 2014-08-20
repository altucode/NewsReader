class CreateFavEntries < ActiveRecord::Migration
  def change
    create_table :fav_entries do |t|

      t.timestamps
    end
  end
end
