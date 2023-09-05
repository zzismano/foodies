class MealsController < ApplicationController
  def new
    #post new meal
    @meal = Meal.new
  end

  def create
    #doesn't need a view page
    @meal = Meal.find(params[:meal_id])
    if @meal.save
      # need to change path to index
      redirect_to meal_path(@meal), notice: "Meal post was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @meal = Meal.find(params[:id])
    @meal.update(meal_params)

    # need to change path to index
    redirect_to meal_path(@meal)
  end

private

  def meal_params
    params.require(:meal).permit(:title, :restaurant, :caption, :lat, :long, :user_id)
  end

end
