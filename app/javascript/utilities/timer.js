document.addEventListener('turbolinks:load', () => {
  const timer = document.getElementById('timer');

  if (timer && Number(timer.dataset.timeLeft) > 0) {
    timer.classList.remove('hide');

    countdown(timer.dataset.timeLeft, timer);
  }
})

function countdown(time, element) {
  const passageId = element.dataset.passageId;
  let mins;
  let secs;

  const interval = setInterval(() => {
    mins = Math.floor(time / 60);
    secs = Math.floor(time % 60);

    if (mins < 10) mins = '0' + mins;
    if (secs < 10) secs = '0' + secs;

    element.textContent = `| Время: ${mins}:${secs}`;

    if (--time == 0) {
      clearInterval(interval);

      element.classList.add('text-danger');
      element.textContent = 'Время вышло';

      setTimeout(() => {
        document.getElementById('passage-form').submit();
      }, 3000);
    }
  }, 1000);
}