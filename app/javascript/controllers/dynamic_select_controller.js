import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["smiley", "choice", "long"]

  connect() {
    this.selected()
  }

  // All items would be hidden at first and will only be visible/ removed hidden class form it
  // when relavent option will be slected
  selected() {
    this.hideFields()
    switch (this.selectTarget.value) {
      // case 'smiley_based':
      //   this.choiceTarget.classList.remove('hidden')
      //   break;
      case 'multiple_choice':
        this.choiceTarget.classList.remove('hidden')
        break;
      case 'open_ended':
        this.longTarget.classList.remove('hidden')
        break;
    }
  }

  // Fields hidden at first
  hideFields() {
    // content for multiple choice hidden
    this.choiceTarget.classList.add('hidden')
    // content for open ended question hidden
    this.longTarget.classList.add('hidden')
    // content for simley based hidden
    // this.longTarget.classList.add('hidden')
  }
}
