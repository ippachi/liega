import { Controller } from "@hotwired/stimulus"
import debounce from "debounce"

// Connects to data-controller="projects"
export default class extends Controller {
  initialize() {
    this.search = debounce(this.search, 500)
  }

  remove() {
    this.element.remove()
  }

  loading() {
    if (document.querySelector("#loading")) return

    this.element.querySelector("#search_result").innerHTML = `
      <div id="loading" class="grid place-content-center h-[50vh]">
        <div class="radial-progress animate-spin" style="--value: 30; --size: 4rem;" />
      </div>
    `
  }

  search() {
    this.element.querySelector("#project_search").requestSubmit()
  }
}
