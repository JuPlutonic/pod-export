# frozen_string_literal: true

# :reek:DuplicateMethodCall
class PodsController < ApplicationController
  before_action :set_tpi, only: %i[new show]

  def show
    @pod = Pod.find_by(tax_payer_id: @tax_payers_id)
  end

  def edit; end

  def update; end

  # PageNav initiation with first_page argument, elements retrieval, scrapping
  def index
    cookies.permanent[:first_time] = 1 and redirect_to(welcome_path) unless cookies.permanent[:first_time]

    @index ||= 0
    (Object.const_defined?(:PagNav) && @index == @page_nav.page) || @page_nav = PageNav.new(@index)
  end

  def new
    @pod = Pod.find_by(tax_payer_id: params[:tax_payer_id]) || Pod.new
  end

  def create
    @pod = Pod.new(pod_params)

    respond_to do |format|
      format.html do
        if @pod.save
          redirect_to pod_url(tax_payer_id: @pod.tax_payer_id), notice: t('.success')
        else
          redirect_to pods_path, notice: t('.alert')
        end
      end
    end
  end
  # ----------------------------------------------------------------------------

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tpi
    @tax_payers_id = params[:tax_payer_id]
  end

  # Only allow a list of trusted parameters through.
  def pod_params
    params.require(:pod).permit(:organization, :tax_payer_id)
  end
end
