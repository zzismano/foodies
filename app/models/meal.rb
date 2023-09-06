class Meal < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_one_attached :photo
end
