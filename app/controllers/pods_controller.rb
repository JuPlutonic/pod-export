# frozen_string_literal: true

# :reek:InstanceVariableAssumption
class PodsController < ApplicationController
  before_action :set_tpi, only: %i[new show]

  def show; end

  def edit; end

  def update; end

  # PageNav initiation with first_page argument, elements retrieval, scrapping
  def index
    @index = @page_nav&.page || 0
    @page_nav = PageNav.new(@index) unless Object.const_defined?(:PagNav) && @index == @page_nav.page
  end

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
    @pod = Pod.find_by(tax_payer_id: params[:tax_payer_id]) || Pod.new
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tpi
    @tax_payers_id = params[:tax_payer_id]
    @pod = Pod.find_by(tax_payer_id: @tax_payers_id)
  end

  # Only allow a list of trusted parameters through.
  def pod_params
    params.require(:pod).permit(:pode_code, :organization, :tax_payer_id, :kind, :government_type)
  end
end
