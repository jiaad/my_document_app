// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

console.log('ca marche');
let radios = document.querySelectorAll('.radio-none')

function remove_class() {
  console.log('en marc he')
  radios.forEach(radio => radio.classList.remove('radio-color'))
}

function select_item(e) {
  remove_class();
  this.classList.add('radio-color');
}

radios.forEach(radio => radio.addEventListener('click', function () {
  alert("wesh")
}))