// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import flatpickr from "flatpickr";
import * as bootstrap from "bootstrap";

window.onload = function() {
    //JavaScript goes here
    const el = document.getElementById('bar');
    flatpickr(el, {
      enableTime:      true,
      altInput:        true,
      minDate:         "today",
      altFormat:       "F j, Y at h:i K",
      dateFormat:      "Y-m-d H:i",
      defaultHour:     23,
      defaultMinute:   59,
      minuteIncrement: 1
    });
  }

