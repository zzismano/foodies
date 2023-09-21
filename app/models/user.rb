class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch::Model
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :meals
  has_many :recipes
  has_one_attached :photo
  followability

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end

  pg_search_scope :global_search,
    against: [ :username, :first_name, :last_name, :city, :country ],
    associated_against: {
      meals:   [ :title, :caption, :restaurant, ],
      recipes: [ :title, :caption, :ingredients, :instructions ]

    },
    using: {
      tsearch: { prefix: true }
    }

end
