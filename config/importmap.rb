pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "stimulus-flatpickr", to: "https://ga.jspm.io/npm:stimulus-flatpickr@1.4.0/dist/index.js"
pin "flatpickr", to: "https://ga.jspm.io/npm:flatpickr@4.6.9/dist/flatpickr.js"
pin "stimulus", to: "https://ga.jspm.io/npm:stimulus@3.0.1/dist/stimulus.js"
pin_all_from "app/javascript/controllers", under: "controllers"