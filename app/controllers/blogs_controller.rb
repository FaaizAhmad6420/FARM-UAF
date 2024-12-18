class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_categories

  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private

  def set_categories
    @categories = Category.all
  end
end
