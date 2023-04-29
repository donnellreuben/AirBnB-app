import { Controller } from '@hotwired/stimulus'
import { toggle } from 'el-transition'

export default class extends Controller {
  static targets = ['openUserMenu', 'search'];

  connect() {
    this.openUserMenuTarget.addEventListener('click', this.toggleDropdownMenu)

    this.searchTarget.addEventListener('click', (e) => {
      e.preventDefault();
      document.getElementById(e.target.dataset.targetId).click();
    });
  }

  toggleDropdownMenu() {
    toggle(document.getElementById('menu-dropdown-items'));
  }
}
