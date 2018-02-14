document.addEventListener('turbolinks:load', function(){
  progressBar = document.querySelector('.progressbar')
  progressBarLabel = document.querySelector('.progressbar_label')
  currentProgress = document.querySelector('.question_body').dataset.progress

  progressBar.style.width = currentProgress + "%"
  progressBar.style.height = "30px"
  progressBar.style.backgroundColor = "#bfff80"
  progressBarLabel.textContent = currentProgress + "%"
}
)
