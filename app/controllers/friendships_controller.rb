class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.create!(asker_id: current_user.id, receiver_id: params[:user_id])
  end

  def destroy

  end
end
