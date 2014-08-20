class FavEntry < ActiveRecord::Base
  validates :user, :entry, presence: true

  belongs_to :user, inverse_of: :fav_entries
  belongs_to :entry, inverse_of: :favorites
end
