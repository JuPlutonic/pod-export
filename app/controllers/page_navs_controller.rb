# frozen_string_literal: true

class PageNavsController < ApplicationController
  def new
    @page_nav = PageNav.new
  end

  def create
    @page_nav = PageNav.new(page_nav_params) # create!(simple_form_strong_parameters(:page_nav))
    # redirect_to page_nav_path(@page_nav)
    respond_to do |format|
      format.js
    end
  end

  private

  def page_nav_params
    params.require(:page_nav).permit(:page)
  end

end
