import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="posts-creator"
export default class extends Controller {
  static targets = ["mealTag", "recipeTag", "recipeSwitch", "mealSwitch"]
  connect() {
    console.log("Hi from the posts creator controller")
  }

  toggleForm(event) {
    this.mealTagTargets.forEach((meal) => {
      meal.classList.toggle("d-none");
    })
    this.recipeTagTargets.forEach((recipe) => {
      recipe.classList.toggle("d-none");
    })
  }
}
