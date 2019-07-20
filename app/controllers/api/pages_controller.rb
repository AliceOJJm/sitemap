module Api
  class PagesController < ApplicationController
    def index
      pages = Page.roots
      respond_to do |format|
        format.json { render json: Page.roots.map { |page| PageSerializer.new(page) } }
      end
    end

    def show
      page = Page.find_by(full_path: "/#{params[:path]}")

      render locals: { page: page }
    end
  end
end
