import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  submitButtonClass = 'mt-4 w-full bg-indigo-600 border border-transparent rounded-md shadow-sm py-3 px-4 text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-50 focus:ring-indigo-500 cursor-pointer'

  connect() {
    this.getStripeFormLabel().classList.add('hidden');
    this.getStripeCardElement().classList.add('mt-4');
    this.getStripeSubmitButton().className += this.submitButtonClass;
  }

  getStripeCardElement() {
    return document.getElementById('card-element');
  }

  getStripeSubmitButton() {
    return document.querySelector('#stripe-form input[type="submit"]');
  }

  getStripeFormLabel() {
    return document.querySelector('label[for="card_element"]');
  }
}
