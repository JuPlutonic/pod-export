# frozen_string_literal: true

# :reek:InstanceVariableAssumption
class PodsController < ApplicationController
  before_action :set_pod, only: %i[show edit update]
  # ---------------set_pod------------------------------------------------------
  def show
    @tax_payers_id = params[:tax_payer_id]
  end

  def edit; end

  def update; end
  # ----------------------------------------------------------------------------

  # -PageNav initiation with first_page argument, elements retrieval, scrapping-
  def index
    # Definition of instance variables, what will be accessed in the
    #   views/pods/index.html.slim file.
    @index_cur_page ||= 0
    @page_nav = PageNav.new(@index_cur_page) unless Object.const_defined?(:PagNav) && @index_cur_page == @page_nav.page
  end
  # ----------------------------------------------------------------------------

  # -User, when visits Pod sees if bots, already scraped data-sets--pod_params--
  # TODO: User sees Pod's open datasets, pod_params have data_attributes: [:id, :date:, source, :author, :converted]
  def create
    @pod = Pod.new(pod_params)

    if @pod.save
      respond_to do |format|
        format.html { redirect_to pod_url(tax_payer_id: @pod.tax_payer_id) }
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
  end
end
