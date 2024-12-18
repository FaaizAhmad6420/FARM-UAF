class HomeController < ApplicationController
    before_action :authenticate_user!
    before_action :set_categories

    def index
    end
    def about
    end

    def service
    end

    def contact
    end
    private

  def set_categories
    @categories = Category.all
  end
end