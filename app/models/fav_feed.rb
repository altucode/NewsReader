class FavFeed < ActiveRecord::Base
  validates :user, :feed, presence: true


  belongs_to :user, inverse_of: :favorites
  belongs_to :feed, inverse_of: :favorites
end
