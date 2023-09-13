class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch::Model
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :meals
  has_many :recipes
  # has_many :friendships_as_asker, class_name: "Friendship", foreign_key: :asker_id
  # has_many :friendships_as_receiver, class_name: "Friendship", foreign_key: :receiver_id
  # has_many :friendships, ->(user) { where("asker_id = ? OR receiver_id = ?", user.id, user.id) }
  # has_many :friendships, dependent: :destroy
  # has_many :receivers, through: :friendships
  # has_many :askers, through: :friendships
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
