class Post < ActiveRecord::Base
  has_many :comments
  has_many :advertisements
  belongs_to :user

  default_scope {order('created_at DESC')}
end

