class Feed < ApplicationRecord
  has_many :recipes
  has_many :meals
end
