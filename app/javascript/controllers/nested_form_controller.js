import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nested-form"
export default class extends Controller {
  connect() {
    console.log("Nested form controller connected!")
  }
}
