import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="posts-creator"
export default class extends Controller {
  static targets = ["mealForm", "recipeForm"]
  connect() {
    console.log("Hi from the posts creator controller")
  }

  toggleForm(event) {
    this.mealFormTarget.classList.toggle("d-none")
    this.recipeFormTarget.classList.toggle("d-none")
  }
}
