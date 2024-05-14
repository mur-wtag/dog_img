import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "dynamicImageLoader"]

  connect() {
    this.formTarget.addEventListener('submit', this.showLoading.bind(this))
  }

  disconnect() {
    this.formTarget.removeEventListener('submit', this.showLoading.bind(this))
  }

  showLoading() {
    this.dynamicImageLoaderTarget.classList.add('loading')
  }
}
