import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"


// Connects to data-controller="click-icon"
export default class extends Controller {
  static targets = ["heart", "comment", "share", "comment-icon", "show-comments", "form", "list", "share-icon"]
  static values = {
    url: String,
    icon: String,
    alertTitle: String,
    alertHtml: String,
    confirmButtonText: String,
    showCancelButton: Boolean,
    cancelButtonText: String
  }

  // static values = { feedbackText: String }

  connect() {
    // console.log("hello from the controller");
    // console.log(this.formTarget);
    // console.log(this.listTarget);
    // console.log(this.data.get("urlValue"));
    // console.log(this.resultTarget);
    console.log(this.urlValue);
  }

  showComment() {
    this.commentTarget.classList.toggle("d-none")
  }

  toggle() {
    this.showCommentsTarget.classList.toggle("hidden")
  }

  toggleHeart() {
    this.heartTarget.classList.toggle("red-heart")
    // this.iconTarget.classList.toggle("fa-heart-solid")
}

  send(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
        if (data.inserted_item) {
          // beforeend could also be dynamic with Stimulus values
          this.listTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        }
        this.formTarget.outerHTML = data.form
    })
  }

  copy(event) {
    const url = `${window.location.origin}${this.urlValue}`
    navigator.clipboard.writeText(url)
    event.currentTarget.disabled = true
    Swal.fire({
      title: 'Link copied! Share with Foodies!',
      icon: 'success',
      confirmButtonText: 'Cool'
    })
  }
}
