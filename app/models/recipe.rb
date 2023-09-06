class Recipe < ApplicationRecord
  belongs_to :feed
  belongs_to :user
  has_many :comments, as: :commentable
  has_many_attached :photos
end
