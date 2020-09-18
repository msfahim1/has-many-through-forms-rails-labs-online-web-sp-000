
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  def user_attributes=(user_attributes)
    unless user_attributes[:username].blank?
      self.user = User.find_or_create_by(username: user_attributes[:username])
    end
  end
end
