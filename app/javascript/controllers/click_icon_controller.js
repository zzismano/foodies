import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="click-icon"
export default class extends Controller {
  static targets = ["heart", "comment", "share", "comment-icon", "show-comments", "form", "list", "result"]
  connect() {
    // console.log("hello from the controller");
    // console.log(this.formTarget);
    // console.log(this.listTarget);
    console.log(this.data.get("urlValue"));
    console.log(this.resultTarget);
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

  // async share(e) {
  //   e.preventDefault();

  //   const shareData = {
  //     url: this.data.get("urlValue"),
  //   };
  //   try {
  //     await navigator.share(shareData);
  //     this.resultTarget.textContent = "MDN shared successfully";
  //   } catch (err) {
  //     this.resultTarget.textContent = `Error: ${err}`;
  //   }
  // }

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
}




//   handleShare() {

// }
