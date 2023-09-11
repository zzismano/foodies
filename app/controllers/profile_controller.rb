class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    authorize @user
    @user_meals = @user.meals
    @user_recipes = Recipe.where(user: current_user).order(created_at: :desc)
    @comment = Comment.new
  end

  def follow
    current_user.send_follow_request_to(@user)
    redirect_to profile_path(@user)
    authorize @user
  end

  def unfollow
    authorize @user
    make_it_a_unfriend_request

    current_user.unfollow(@user)
    redirect_to profile_path(@user)
  end

  def accept
    authorize @user
    current_user.accept_follow_request_of(@user)
    make_it_a_friend_request
    redirect_to root_path
  end

  def decline
    authorize @user
    current_user.decline_follow_request_of(@user)
    redirect_to root_path
  end

  def cancel
    authorize @user
    current_user.remove_follow_request_for(@user)
    redirect_to profile_path(@user)
  end

  private

  def make_it_a_friend_request
    current_user.send_follow_request_to(@user)
    @user.accept_follow_request_of(current_user)
  end

  def make_it_a_unfriend_request
    @user.unfollow(current_user) if @user.mutual_following_with?(current_user)
  end

  def set_user
    @user = current_user
  end

  def create_post
    authorize current_user
    @meal = Meal.new
    @recipe = Recipe.new
  end
end
