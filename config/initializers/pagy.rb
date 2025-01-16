require 'pagy/extras/bootstrap'
require 'pagy/extras/overflow'

Pagy::DEFAULT[:limit] = 12
Pagy::DEFAULT[:size]  = 3
Pagy::DEFAULT[:overflow] = :empty_page
