class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  def show
    authorize @user
    @user_meals = @user.meals
    @user_recipes = @user.recipes
    @comment = Comment.new
  end

  def index

  end

  def set_user
    @user = User.find(params[:id])
  end
end
