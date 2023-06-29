import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {

  static targets = [ "like", "dislike" ]

  connect () {
    console.log("hello");
  }

  like() {
    this.likeTarget.classList.add("d-none");
    this.dislikeTarget.classList.remove("d-none");
  }

  dislike() {
    this.dislikeTarget.classList.add("d-none");
    this.likeTarget.classList.remove("d-none");
  }
}
