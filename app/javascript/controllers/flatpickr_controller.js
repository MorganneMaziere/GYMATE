import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "eventDate" ]

  connect() {
    flatpickr(this.eventDateTarget, {
      enableTime: true,
      minDate: "today",
      altFormat: "F j, Y",
      dateFormat: "Y-m-d"
    });
  }
}
