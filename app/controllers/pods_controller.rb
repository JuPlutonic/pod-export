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

  # ---------------set_pod, scrape, elem_retrieval------------------------------
  def index
    @index_cur_page ||= 0
    # TODO: add memoization of @page_nav and reimplemet to call from here
    #   as method and this method must have Thread.new inside.
    @page_nav = PageNav.new(@index_cur_page)
    @index_cur_page = @page_nav.current_page
    @index_last_page = @page_nav.last_page

    @page_nav.scrape(@index_cur_page)
    @elements = elem_retrieval(@page_nav.pod_ids, Pod.all)
  end

  # ---------------scrape_data, pod_params--------------------------------------
  def create
    # TODO: NOKOGIRI SIDEKIQ REDIS
    @pod = Pod.new(pod_params)
    @pod.save
    # @pod.data.build
    @page_nav.scrape_data(@pod) # @tax_payer_id

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

  # Attributes: @pod_ids => tax_payer_id_numbers_on_page,
  #              array of scrapped tax_payer's id numbers
  #             Pod.all => pods
  def elem_retrieval(tax_payer_id_numbers_on_page, pods)
    elements = []
    tax_payer_id_numbers_on_page.each do |pod|
      elements << if pods.where(tax_payer_id: pod).blank?
                    'получить данные'
                  else
                    'показать данные'
                  end
    end
    elements
  end
end
