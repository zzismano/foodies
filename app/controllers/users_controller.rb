class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  def show
    authorize @user
    @user_meals = @user.meals
    @user_recipes = Recipe.where(user: current_user).order(created_at: :desc)
    @comment = Comment.new
  end

  def index

  end




  def set_user
    @user = current_user
  end
end
