class Favorite < ActiveRecord::Base
  validates :gist_id, uniqueness: { scope: :user_id }
  belongs_to :user
  belongs_to :gist
end
