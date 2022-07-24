# frozen_string_literal: true

# :reek:InstanceVariableAssumption
class PodsController < ApplicationController
  before_action :set_tpi, only: %i[show edit update]

  def show
    @tax_payers_id = params[:tax_payer_id]
  end

  def edit; end

  def update; end

  # -PageNav initiation with first_page argument, elements retrieval, scrapping-
  def index
    @index = @page_nav&.page || 0
    @page_nav = PageNav.new(@index) unless Object.const_defined?(:PagNav) && @index == @page_nav.page
  end
  # ----------------------------------------------------------------------------

  # -User, when visits Pod sees if bots, already scraped data-sets--pod_params--
  def create
    @pod = Pod.new(pod_params)

    if @pod.save
      flash[:success] = t('.success')
      respond_to do |format|
        format.html { redirect_to pod_url(tax_payer_id: @pod.tax_payer_id) }
      end
    else
      flash[:alert] = t('.alert')
      redirect_to '/'
    end
  end
  # ----------------------------------------------------------------------------

  def new
    @pod = Pod.new
  end

  private

  def set_tpi
    @pod = Pod.find(params[:tax_payer_id])
  end

  def pod_params
    params.require(:pod).permit(:organization, :tax_payer_id)
  end
end
