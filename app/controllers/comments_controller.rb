class CommentsController < ApplicationController

  def new
  @meal = Meal.find(params[:meal_id])
  @comment = Comment.new

  @recipe = Recipe.find(params[:recipe_id])
  @comment = Comment.new

  end


  def create
    @comment = Comment.new(comment_params)
    @comment.meal = @comment

    @comment.save
    redirect_to meal_path(@meal)

    @comment = Comment.new(comment_params)
    @comment.recipe = @comment
    @comment.save
    redirect_to recipe_path(@recipe)

  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_comment_params
    params.require(:recipe).permit(:content, :commentable_id, :commentable_type)
  end

  def meal_comment_params
    params.require(:meal).permit(:content, :commentable_id, :commentable_type)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to meal_path(@review.meal), status: :see_other
  end



end
