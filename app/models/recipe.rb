class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many_attached :photos
  include PgSearch::Model
  pg_search_scope :global_search,
    against:   [:title, :caption, :ingredients, :instructions ],
    associated_against: {
      user:   [ :username, :first_name, :last_name, :city, :country ]
      },
      using: {
        tsearch: { prefix: true }
      }

end
