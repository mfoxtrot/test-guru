document.addEventListener('turbolinks:load', function(){
  var timerElement = document.querySelector('.timer')
  if (timerElement) {
    var timeRemaining = timerElement.dataset.remainingTime;
    startTimer(timerElement, timeRemaining);
  }
}
)

function startTimer(control, timeRemaining) {
  if (timeRemaining > 0) {
    var timerLabel = document.querySelector('.timer_label');
    timerLabel.textContent = timeRemaining;
    timeRemaining--;
    setTimeout(startTimer, 1000, control, timeRemaining);
  } else {
    var resultPage = window.location.href + '/result';
    window.location.replace(resultPage);
  }
}
