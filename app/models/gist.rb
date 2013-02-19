class Gist < ActiveRecord::Base
  attr_accessible :title, :user_id, :user, :gist_files_attributes

  belongs_to :user
  has_many :favorites
  has_many :gist_files

  accepts_nested_attributes_for :gist_files

  # why make this a class method
  def favorited?(user)
    !Favorite.where(user_id: user.id, gist_id: self.id).empty?
  end
end
