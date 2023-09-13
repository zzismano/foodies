import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="posts-creator"
export default class extends Controller {
  static targets = ["mealTag", "recipeTag", "userTag", "recipeSwitch", "mealSwitch", "userSwitch"]
  connect() {
    console.log("Hi from the toggle switch controller")
  }

  toggleForm(event) {
    this.mealTagTargets.forEach((meal) => {
      meal.classList.add("d-none");
    })
    this.recipeTagTargets.forEach((recipe) => {
      recipe.classList.add("d-none");
    })
    this.userTagTargets.forEach((user) =>{
      user.classList.add("d-none");
    })
    if (this.mealSwitchTarget.checked) {
      this.mealTagTargets.forEach((meal) => {
        meal.classList.toggle("d-none");
      })
    } else if (this.recipeSwitchTarget.checked) {
      this.recipeTagTargets.forEach((recipe) => {
        recipe.classList.toggle("d-none");
      })
    } else if (this.userSwitchTarget.checked) {
      this.userTagTargets.forEach((user) =>{
        user.classList.toggle("d-none");
      })
    }



    console.log(this.userSwitchTarget.checked);
  }
}
