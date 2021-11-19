import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["smile", "choice", "long"];

  connect() {
    console.log("hello from Dynamic Select");
    this.hideFields();
    this.displayFields('open_ended');
  }

  selected(event) {
    this.hideFields();
    this.displayFields(event.target.value);
  }

  hideFields() {
    this.choiceTarget.classList.add('hidden');
    this.longTarget.classList.add('hidden');
    this.smileTarget.classList.add('hidden');
  }

  displayFields(value) {
    switch (value) {
      case 'smiley_based':
        this.smileTarget.classList.remove('hidden');
        break;

      case 'multiple_choice':
        this.choiceTarget.classList.remove('hidden');
        break;

      case 'open_ended':
        this.longTarget.classList.remove('hidden');
        break;
    }
  }
}
