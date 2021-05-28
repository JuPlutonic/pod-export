# frozen_string_literal: true

class PageNavsController < ApplicationController
  def new
    @page_nav = PageNav.new
  end

  def create
    @page_nav = PageNav.new(page_nav_params)

    respond_to(&:js) # - format
  end

  private

  def page_nav_params
    # OPTIMIZE: Something wrong with with 'ActionController::Parameters', what is 'permitted: false'
    # OPTIMIZE: __and can be accessed only by 'params[:page_nav][:page]' hash key.
    params.require(:page_nav).permit(:page)
  end
end
