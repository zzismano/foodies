class CommentsController < ApplicationController

  def new
  @meal = Meal.find(params[:meal_id])
  @comment = Comment.new

  @recipe = Recipe.find(params[:recipe_id])
  @comment = Comment.new

  end


  def create
    if params[:comment][:commentable_type] == "Meal"
      @meal = Meal.find_by(id: params[:comment][:commentable_id])
      @comment = Comment.new(meal_comment_params)
      @comment.user = current_user
      authorize @comment
      respond_to do |format|
        if @comment.save
          format.html { redirect_to user_path(current_user) }
          format.json # Follows the classic Rails flow and look for a create.json view
        else
          format.html { render "comments/new", status: :unprocessable_entity }
          format.json # Follows the classic Rails flow and look for a create.json view
        end
      end
    else
      @recipe = Recipe.find_by(id: params[:comment][:commentable_id])
      @comment = Comment.new(recipe_comment_params)
      @comment.user = current_user
      authorize @comment
      respond_to do |format|
        if @comment.save
          format.html { redirect_to user_path(current_user) }
          format.json # Follows the classic Rails flow and look for a create.json view
        else
          format.html { render "comments/new" , status: :unprocessable_entity }
          format.json # Follows the classic Rails flow and look for a create.json view
        end
      end
    end
  end

  def destroy
    authorize current_user
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_back(fallback_location: root_path)
    end
    # if @comment.commentable_type == "Meal"
    #   redirect_to user_meal_path(@comment.commentable.user.id, @comment.commentable.id)
    # else
    #   redirect_to user_recipe_path(@comment.commentable.user.id, @comment.commentable.id)
    # end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end

  def meal_comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end

  # def destroy
  #   @review = Review.find(params[:id])
  #   @review.destroy
  #   redirect_to meal_path(@review.meal), status: :see_other
  # end

end
