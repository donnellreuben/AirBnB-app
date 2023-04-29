import { Controller } from '@hotwired/stimulus'
import axios from 'axios';

export default class extends Controller {
  HEADERS = { 'ACCEPT': 'application/json' };

  favorite(e) {
    e.preventDefault();
    if (this.element.dataset.userLoggedIn === 'false') {
      Turbo.visit('/users/sign_in');
    }

    if (this.element.dataset.favorited === 'true') {
      this.unfavoriteProperty();
    } else {
      this.favoriteProperty();
    }
  }

  getFavoritePath() {
    return '/api/favorites';
  }

  getUnfavoritePath(favoriteId) {
    return `/api/favorites/${favoriteId}`
  }

  favoriteProperty() {
    axios.post(this.getFavoritePath(), {
      user_id: this.element.dataset.userId,
      property_id: this.element.dataset.propertyId
    }, {
      headers: this.HEADERS
    })
    .then((response) => {
      this.element.dataset.favorited = 'true'
      this.element.dataset.favoriteId = response.data.id;
      this.element.setAttribute('fill', this.element.dataset.favoritedColor);
    });
  }

  unfavoriteProperty() {
    axios.delete(this.getUnfavoritePath(this.element.dataset.favoriteId), {
      headers: this.HEADERS
    }).then((response) => {
      this.element.dataset.favorited = 'false'
      this.element.dataset.favoriteId = '';
      this.element.setAttribute('fill', this.element.dataset.unfavoritedColor);
    });
  }
}
