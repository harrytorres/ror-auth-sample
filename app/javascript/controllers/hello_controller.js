import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hello"
export default class extends Controller {
  static targets = ["output"]

  connect() {
    console.log("HelloController connected")
    this.outputTarget.textContent = "Hello, Stimulus!"
  }

  greet() {
    const name = this.element.dataset.name || "World"
    this.outputTarget.textContent = `Hello, ${name}!`
  }
}
