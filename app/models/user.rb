class User < ActiveRecord::Base
  attr_accessible :user_name

  has_many :gists
  has_many :favorites

  def reset_token
    self.token = SecureRandom.urlsafe_base64
    self.save!
  end

  def delete_token
    self.token = nil
    self.save!
  end
end
