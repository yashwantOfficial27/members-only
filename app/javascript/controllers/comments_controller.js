import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    initialize() {
        console.log('Started')
    }
  connect() {
    console.log('Hello world!');
  }

  toggleEdit(event) {
    event.preventDefault();
    event.stopPropagation();

    const formId = event.params['form'];
    const commentBodyId = event.params['body'];
    
    const form = document.getElementById(formId);
    form.classList.toggle('d-none');

    const commentBody = document.getElementById(commentBodyId);
    commentBody.classList.toggle('d-none');
  }
}
