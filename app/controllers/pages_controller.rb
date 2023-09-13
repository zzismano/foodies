class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :search ]

  def home
    @comment = Comment.new
    meals = Meal.all.order(created_at: :desc)
    recipes = Recipe.all.order(created_at: :desc)
    @posts = []
    meals.each do |meal|
      @posts << meal
    end
    recipes.each do |recipe|
      @posts << recipe
    end
  end


end
