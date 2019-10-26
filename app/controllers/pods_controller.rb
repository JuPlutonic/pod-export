# frozen_string_literal: true

class PodsController < ApplicationController
  before_action :set_pod, only: %i[show edit update]
  # ---------------set_pod------------------------------------------------------
  def show
    @tax_payers_id = params[:tax_payer_id]
  end

  def edit; end

  def update; end
  # ----------------------------------------------------------------------------

  # ---------------elem_retrieval, scrapping...---------------------------------
  def index
    # Definition of instance variables, what will be accessed in the
    #   views/pods/index.html.slim file.
    @index_cur_page ||= 0

    @page_nav = PageNav.new(@index_cur_page) unless Object.const_defined?(:PagNav) && @index_cur_page == @page_nav.page
    @index_last_page ||= @page_nav.last_page
  end
  # ----------------------------------------------------------------------------

  # ---------------scrape_data, pod_params--------------------------------------
  # TODO: NOKOGIRI SIDEKIQ REDIS implementation, method @page_nav.scrape_data(@pod OR @tax_payer_id).
  def create
    @pod = Pod.new(pod_params)
    @pod.save
    # @pod.data.build

    if @pod.save
      respond_to do |format|
        format.html { redirect_to pod_url(tax_payer_id: @pod.tax_payer_id) } # { redirect_to pods_url }
      end
    else
      redirect_to '/'
    end
  end
  # ----------------------------------------------------------------------------

  def new
    @pod = Pod.new
  end

  private

  def set_pod
    @pod = Pod.find(params[:tax_payer_id])
  end

  def pod_params
    params.require(:pod).permit(:organization, :tax_payer_id)
    # , data_attributes: [:id, :date:, source, :author, :converted])
  end
end
