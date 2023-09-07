// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"


const ShowRecipes = document.querySelector(".recipes-filter");

ShowRecipes.addEventListener('click', () => {
  recipesList.classList.remove("d-none");
  mealsList.classList.add("d-none");
});

const ShowMeals = document.querySelector(".meals-filter")

ShowMeals.addEventListener('click', () => {
  mealsList.classList.remove("d-none");
  recipesList.classList.add("d-none");
});



const mealsList = document.querySelector(".meals");

const recipesList = document.querySelector(".recipes");
