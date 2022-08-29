# frozen_string_literal: true

class PageNavsController < ApplicationController
  def new
    @page_nav = PageNav.new
  end

  def create
    @page_nav = PageNav.new(page_nav_params)

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def page_nav_params
    params.require(:page_nav).permit(:tpis, :page)
  end
end
