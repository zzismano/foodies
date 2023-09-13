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

  def search
    authorize current_user
    if params[:query].present?
      @users = User.global_search(params[:query])
      @meals = Meal.global_search(params[:query])
      @recipes = Recipe.global_search(params[:query])
    else
      @users = User.all
      @meals = Meal.all
      @recipes = Recipe.all
    end
  end

  def create_post
    authorize current_user
    @meal = Meal.new
    @recipe = Recipe.new
  end

  def set_user
    @user = current_user
  end
end
