class PagesController < ApplicationController
  def show
    page = Page.find_by!(full_path: "/#{params[:path]}")

    render locals: { page: page }
  end
end
