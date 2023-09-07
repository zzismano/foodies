class FeedController < ApplicationController
  def index
    @meals = Meal.all
    @recipes = Recipe.all
  end

  def show
  end

end
