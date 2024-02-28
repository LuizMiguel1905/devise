// stimulus/controllers/test-two_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.fetchData();
    this.fetchValidations();
    this.fetchAttribute();
  }

  fetchData() {
    fetch('http://127.0.0.1:3000/api/components', {
      method: 'GET',
      credentials: 'include',
    })
      .then(response => response.json())
      .then(data => this.populateDropdown(data))
      .catch(error => console.error('Error fetching data:', error));
  }
  fetchValidations() {
    console.log('')
    fetch('http://127.0.0.1:3000/api/component_validations', {
      method: 'GET',
      credentials: 'include',
    })
      .then(response => response.json())
      .then(data => console.log(data))
      .catch(error => console.error('Error fetching attribute data:', error)); 
  }
  fetchAttribute() {
    console.log('eae')
    fetch('http://127.0.0.1:3000/api/component_attributes', {
      method: 'GET',
      credentials: 'include',
    })
      .then(response => response.json())
      .then(data => console.log(data))
      .catch(error => console.error('Error fetching attribute data:', error)); 
  }
  

  populateDropdown(data) {

    const dropdown = this.element;

    dropdown.innerHTML = "";

    data.forEach(component => {
      const option = document.createElement("option");
      option.value = component.componentName;
      option.text = `${component.componentName}`

      dropdown.appendChild(option);
    });
    
    console.log('Stimulus funcionando e dropdown funcionando');
  }

  updateSelectedComponent(event) {
    const selectedValue = event.target.value;
    const hiddenFieldId = this.data.get("hiddenFieldId");
    const hiddenField = document.getElementById(hiddenFieldId);
    if (hiddenField) {
      hiddenField.value = selectedValue;
      console.log(hiddenField.value);
      
    }
    }
  
}
