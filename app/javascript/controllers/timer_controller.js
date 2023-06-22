import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["countdown"];

  connect() {
    // console.log("Connected")
    const startDate = new Date(this.countdownTarget.dataset.date).getTime();
    // console.log(startDate)
    const updateTimer = () => {
      const now = new Date().getTime();
      // console.log(now)
      const timeLeft = startDate - now;

      const days = Math.floor(timeLeft / (1000 * 60 * 60 * 24));
      const hours = Math.floor((timeLeft % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      const minutes = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60));
      const seconds = Math.floor((timeLeft % (1000 * 60)) / 1000);

      this.countdownTarget.textContent = `${days}d ${hours}h ${minutes}m ${seconds}s`;

      if (timeLeft < 0) {
        clearInterval(timerInterval);
        this.countdownTarget.textContent = "Departure time passed";
      }
    };

    updateTimer();
    const timerInterval = setInterval(updateTimer, 1000);
  }
}
