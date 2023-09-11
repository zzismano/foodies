import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="click-icon"
export default class extends Controller {
  static targets = ["heart", "comment", "share", "comment-icon", "show-comments"]
  connect() {
    // console.log("hello from the controller");
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

  async share(e) {
    e.preventDefault();

    const shareData = {
      url: this.data.get("urlValue"),
    };
    try {
      await navigator.share(shareData);
      this.resultTarget.textContent = "MDN shared successfully";
    } catch (err) {
      this.resultTarget.textContent = `Error: ${err}`;
    }
  }
}




//   handleShare() {

// }
