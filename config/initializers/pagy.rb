require 'pagy/extras/bootstrap'
require 'pagy/extras/overflow'

Pagy::DEFAULT[:limit] = 9
Pagy::DEFAULT[:size]  = 3
Pagy::DEFAULT[:overflow] = :empty_page
