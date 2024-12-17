class HomeController < ApplicationController
    before_action :authenticate_user!

    def about
    end

    def service
    end
end