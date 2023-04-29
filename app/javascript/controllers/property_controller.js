import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  readDescription(e) {
    e.preventDefault();

    document.getElementById('property-description-trigger').click();
  }
}
