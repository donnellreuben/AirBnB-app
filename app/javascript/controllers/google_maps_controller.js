import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['map', 'property'];

  connect() {
    this.mapTarget.style.height = '100%';
    const firstProperty = this.propertyTargets[0];
    const firstPosition = { lat: parseFloat(firstProperty.dataset.latitude), lng: parseFloat(firstProperty.dataset.longitude) };
    const map = new google.maps.Map(this.mapTarget, {
      center: firstPosition,
      zoom: 8,
    });

    window.initMap = map;

    this.propertyTargets.forEach((property) => {
      const position = { lat: parseFloat(property.dataset.latitude), lng: parseFloat(property.dataset.longitude) };
      const marker = new google.maps.Marker({
        position,
        map
      });
    });
  }
}
