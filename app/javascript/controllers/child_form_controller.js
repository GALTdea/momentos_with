import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="child-form"
export default class extends Controller {
  static targets = ["form"]

  connect() {
   console.log("Connected to child-form controller")
  }
  toggleForm(event) {
    event.preventDefault();
    this.formTarget.classList.toggle("hidden");
  }

  submitEnd(event) {
    const [data, status, xhr] = event.detail;
    // Check for successful creation
    if (status === 'OK') {
      // Close the form and update the dropdown, for example
      this.toggleForm();
      // Optionally, use Turbo to refresh part of the page to update the dropdown
      Turbo.visit(window.location.href, { action: "replace" })
    } else {
      // Handle errors, maybe display them in the form
    }
  }
}
