import { Controller } from "stimulus"

export default class extends Controller {
  // "add_item" and "template" are static tags in the view and will not change
  static targets = ["add_item", "template"]

  // Code to add new Question or Answer
  add_association(event) {
    event.preventDefault()
    // Get the template defined in form view in <template> tags and add a unique id with it using time for
    // every question/answer added
    var content = this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, new Date().getTime())
    // Add the template to the page
    this.add_itemTarget.insertAdjacentHTML('beforebegin', content)
  }

  // Code to remove clicked Question ors Answer
  remove_association(event) {
    event.preventDefault()
    // Get the closest div with nested-fields class
    let item = event.target.closest(".nested-fields")
    // Pass a true check to allow destruction of that item
    item.querySelector("input[name*='_destroy']").value = 1
    // Also Hide it as it will be destroyed later and we should not see it when removed
    item.style.display = 'none'
  }
}
