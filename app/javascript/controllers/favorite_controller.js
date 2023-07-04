import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {

  // static targets = [ "like", "dislike" ]

  connect () {
    console.log("hello");
  }

  like() {
    document.querySelector("#like").classList.add("d-none");
    document.querySelector("#dislike").classList.remove("d-none");
  }

  dislike() {
    document.querySelector("#dislike").classList.add("d-none");
    document.querySelector("#like").classList.remove("d-none");
  }
}
