# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js", preload: true


# config/importmap.rb
pin "jquery", to: "https://code.jquery.com/jquery-3.4.1.min.js"
pin "easing", to: "lib/easing/easing.min.js"
pin "waypoints", to: "lib/waypoints/waypoints.min.js"
pin "counterup", to: "lib/counterup/counterup.min.js"
pin "owlcarousel", to: "lib/owlcarousel/owl.carousel.min.js"
pin "main", to: "main.js"
