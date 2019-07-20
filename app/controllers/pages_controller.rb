class PagesController < ApplicationController
  def index
    pages = Page.all

    respond_to do |format|
      format.json { render json: pages }
    end
  end
end
