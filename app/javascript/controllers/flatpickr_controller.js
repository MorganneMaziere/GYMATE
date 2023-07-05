import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "eventDate" ]

  connect() {
    flatpickr(this.eventDateTarget, {
      altInput: true,
      dateFormat: "Y-m-d",
      altFormat: "F j, Y",
      minDate: "today",
      noCalendar: false
    });
  }
}
