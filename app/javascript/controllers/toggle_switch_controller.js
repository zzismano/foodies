import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="posts-creator"
export default class extends Controller {
  static targets = ["mealTag", "recipeTag"]
  connect() {
    console.log("Hi from the posts creator controller")
  }

  toggleForm(event) {
    this.mealTagTarget.classList.toggle("d-none")
    this.recipeTagTarget.classList.toggle("d-none")
  }
}
