document.addEventListener('turbolinks:load', function () {
  var button = document.querySelector('.next');
  if (button) button.addEventListener('click', addResult(button.dataset.result))
});

function addResult(result) {
  document.querySelector('.result-bar').style["width"] = result + "%"
}