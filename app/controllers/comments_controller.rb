class CommentsController < ApplicationController

  def new
  @meal = Meal.find(params[:meal_id])
  @comment = Comment.new

  @recipe = Recipe.find(params[:recipe_id])
  @comment = Comment.new

  end


  def create
    if params[:comment][:commentable_type] == "Meal"
      @comment = Comment.new(meal_comment_params)
      @comment.user = current_user
      authorize @comment
      @comment.save
      redirect_to user_path(current_user)
    else
      @comment = Comment.new(recipe_comment_params)
      @comment.user = current_user
      authorize @comment
      @comment.save
      redirect_to user_path(current_user)
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_comment_params
    params.require(:recipe).permit(:content, :commentable_id, :commentable_type)
  end

  def meal_comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to meal_path(@review.meal), status: :see_other
  end

end
