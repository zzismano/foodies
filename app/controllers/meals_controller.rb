class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def new
    #post new meal
    @meal = Meal.new
    @user = User.find(params[:user_id])
    authorize @meal
  end

  def create
    #doesn't need a view page
    @meal.user = current_user
    @meal = Meal.new(meal_params)
    
    authorize @meal
    if @meal.save
      # need to change path to index
      redirect_to user_meal_path(current_user, @meal), notice: "Meal post was successfully created"
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
    params.require(:meal).permit(:title, :restaurant, :caption, :lat, :long)
  end

end
