import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  copyLink() {
    navigator.clipboard.writeText(this.element.dataset.shareUrl);
  }
}
