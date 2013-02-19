class Favorite < ActiveRecord::Base
  attr_accessible :user, :gist

  validates :gist_id, uniqueness: { scope: :user_id }
  belongs_to :user
  belongs_to :gist
end