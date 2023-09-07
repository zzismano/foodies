class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  def show
    authorize @user
    @user_meals = @user.meals
    @user_recipes = @user.recipes
  end

  def index

  end

  def create_post
    @meal = Meal.new
    @recipe = Recipe.new
  end

  def set_user
    @user = User.find(params[:id])
  end
end
