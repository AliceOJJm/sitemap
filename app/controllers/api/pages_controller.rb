module Api
  class PagesController < ApplicationController
    def index
      respond_to do |format|
        format.json { render json: { pages: Page.roots.map { |page| PageSerializer.new(page) } } }
      end
    end
  end
end
