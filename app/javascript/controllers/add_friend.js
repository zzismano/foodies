import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button"]

  connect() {
    console.log("Hello from the add friend controller!")
  }

  friend() {

  }



}
