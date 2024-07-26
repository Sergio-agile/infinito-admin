import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['query'];

  connect() {
    console.log('Search controller connected');
    console.log("Targets:", this.queryTarget);
  }
}
