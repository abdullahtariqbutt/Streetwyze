import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["smile", "choice", "long"]

  connect() {
    console.log("hello from Dynamic Select");
    this.hideFields();
    this.displayFields('open_ended');
  }

  selected(event) {
    this.hideFields();
    this.displayFields(event.target.value)
  }

  hideFields() {
    this.choiceTarget.classList.add('hidden');
    this.longTarget.classList.add('hidden');
    this.smileTarget.classList.add('hidden');
  }

  displayFields(value) {
    switch (value) {
      case 'smiley_based':
        console.log("Smiley Section Shown");
        this.smileTarget.classList.remove('hidden');
        break;
      case 'multiple_choice':
        console.log("multiple_choice Section Shown");
        this.choiceTarget.classList.remove('hidden');
        break;
      case 'open_ended':
        console.log("open_ended Section Shown");
        this.longTarget.classList.remove('hidden');
        break;
    }
  }
}
