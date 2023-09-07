class Friendship < ApplicationRecord
  belongs_to :asker, class_name: "User"
  belongs_to :receiver, class_name: "User"

  def self.create_reciprocal_for_ids(asker_id, receiver_id)
    asker_friendship = Friendship.create(asker_id: receiver_id, receiver_id: receiver_id)
    receiver_friendship = Friendship.create(asker_id: receiver_id, receiver_id: asker_id)
    [asker_friendship, receiver_friendship]
  end

  def self.destroy_reciprocal_for_ids(asker_id, receiver_id)
    friendship1 = Friendship.find_by(asker_id: asker_id, receiver_id: receiver_id)
    friendship2 = Friendship.find_by(asker_id: receiver_id, receiver_id: asker_id)
    friendship1.destroy
    friendship2.destroy
  end

end
