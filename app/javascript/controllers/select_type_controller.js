// app/javascript/controllers/select_type_controller.js
import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['select', 'label'];

  connect() {
    this.updateLabel();
  }

  updateLabel() {
    const selectedValue = this.selectTarget.value;
    this.labelTarget.textContent = `Selected Component Type: ${selectedValue}`;
  }
}
