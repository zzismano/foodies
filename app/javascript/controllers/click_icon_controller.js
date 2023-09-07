import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="click-icon"
export default class extends Controller {
  static targets = ["heart", "comment", "share"]
  connect() {
    // console.log("hello from the controller");
  }

  createComment() {
    const comment = this.commentTarget.value;
    const commentId = this.data.get("postId");
    fetch('/comments/new', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({ post_id: postId, content: content })
    })
    .then(response => response.json())
    .then(data => {
      console.log('Comment created:', data);})
  }
}

  toggleHeart() {

}

  handleShare() {

}
