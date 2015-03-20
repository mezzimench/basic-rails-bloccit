class Post < ActiveRecord::Base
  has_many :comments
  has_many :advertisements
  belongs_to :user
  scope :ordered_by_title, -> {Post.where(title: :asc)}
  scope :ordered_by_reverse_created_at, -> {Post.where(created_at: :desc)}
  default_scope {order('created_at DESC')}


end

