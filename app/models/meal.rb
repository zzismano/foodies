class Meal < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :global_search,
    against:   [ :title, :caption, :restaurant],
    associated_against: {
      user:   [ :username, :first_name, :last_name, :city, :country ]
      },
      using: {
        tsearch: { prefix: true }
      }
end
