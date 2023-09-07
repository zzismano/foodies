class FeedController < ApplicationController
  def index
<<<<<<< HEAD
  end
=======
    @meals = Meal.all
    @recipes = Recipe.all
  end

  def show
  end

>>>>>>> 10d429a44d24ee25cdb217160e742a95289f6295
end
