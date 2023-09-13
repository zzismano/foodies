class MealsController < ApplicationController
  def index
    @meals = Meal.all
    @geo_meals = Meal.geocoded
    @markers = @geo_meals.map do |meal|
      {
      lat: meal.latitude,
      lng: meal.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: {meal: meal}),
      marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    authorize current_user
    @meal = Meal.find(params[:id])
    @comment = Comment.new
  end

  def new
    #post new meal
    @meal = Meal.new
    @user = User.find(params[:user_id])
    authorize @meal
  end

  def create
    #doesn't need a view page
    @meal = Meal.new(meal_params)
    @meal.user = current_user

    authorize @meal
    authorize current_user
    if @meal.save
      # need to change path to index
      redirect_to root_path, notice: "Meal post was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize current_user
    @meal = Meal.find(params[:id])
  end

  def update
    authorize current_user
    @meal = Meal.find(params[:id])
    @meal.update(meal_params)

    # need to change path to index
    redirect_to user_meal_path(@meal.user.id, @meal.id)
  end

  def destroy
    authorize current_user
    @meal = Meal.find(params[:id])
    @meal.destroy

    if @meal.destroy
      redirect_to profile_path(current_user)
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:title, :restaurant, :caption, :lat, :long, :photo)
  end

end
