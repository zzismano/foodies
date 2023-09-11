class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    authorize current_user
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
  end

  def new
    @recipe = Recipe.new
    @user = User.find(params[:user_id])
    authorize @recipe
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    authorize @recipe
    authorize current_user
    if @recipe.save
      redirect_to user_path(@recipe.user), notice: "Recipe was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)

    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    if @recipe.destroy
      redirect_to user_path(current_user)
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :instructions, :caption)
  end
end
