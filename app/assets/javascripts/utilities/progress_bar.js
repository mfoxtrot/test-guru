document.addEventListener('turbolinks:load', function(){
  var progressBar = document.querySelector('.progressbar')
  var progressBarLabel = document.querySelector('.progressbar_label')
  var currentProgress = progressBar.dataset.progress

  progressBar.style.width = currentProgress + "%"
  progressBar.style.height = "30px"
  progressBar.style.backgroundColor = "#bfff80"
  progressBarLabel.textContent = currentProgress + "%"
}
)
