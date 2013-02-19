class Gist < ActiveRecord::Base
  attr_accessible :title, :user_id, :user
  belongs_to :user
  has_many :favorites

  # why make this a class method
  def favorited?(user)
    !Favorite.where(user_id: user.id, gist_id: self.id).empty?
  end
end
