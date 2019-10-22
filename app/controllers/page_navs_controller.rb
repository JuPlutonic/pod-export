# frozen_string_literal: true

class PageNavsController < ApplicationController
  def new
    @page_nav = PageNav.new
  end

  def create
    @page_nav = PageNav.create!(simple_form_strong_parameters(:page_nav))
    redirect_to page_nav_path(@page_nav)
  end
end
