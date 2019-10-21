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
    @pods = Pod.all
    @cur_page ||= 0
    # TODO: CACHE VIEWS IF CUR_PAGE=0
    scrape(@cur_page)
    @elements = elem_retrieval(@pod_ids, @pods)
  end

  # ---------------scrape_data, pod_params--------------------------------------
  def create
    # TODO: NOKOGIRI SIDEKIQ REDIS
    @pod = Pod.new(pod_params)
    @pod.save
    # @pod.data.build
    scrape_data(@pod) # @tax_payer_id

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

  # rubocop:disable Metrics/AbcSize
  # TODO: Filter '' needs to be passed by default.
  # TODO: base_url with the page number query need to be implemented.
  def scrape(_cur_page = 0)
    require 'open-uri'

    base_url = 'https://data.gov.ru/organizations'
    doc = Nokogiri::HTML(URI.parse(base_url).open, nil, 'UTF-8')
    @pod_organizations = []
    @pod_ids = []

    # If we start browsing base_url, li[12] will be the last paginated table
    if @cur_page.zero? && @last_page.nil?
      @last_page = doc
                   .xpath('//div[3]/ul/li[12]/a')
                   .to_s
                   .gsub(/^.*=/, '') # removes unuseful parts of url query
                   .gsub(/\D/, '').to_i # removes non digit parts of html tags
    end

    doc = doc.xpath('//tbody')
    doc.xpath('//td[2]/a').each do |anchor|
      @pod_organizations << anchor.text.strip

      # gsub does deletion of /organization/ - it remains only taxpayer's id:
      @pod_ids << anchor.xpath('@href').to_s.gsub(%r{(/\w+/)(\d+)}, '\2').to_s
    end
  end
  # rubocop:enable Metrics/AbcSize

  # Attributes: @pod_ids => tax_payer_id_numbers_on_page,
  #              array of scrapped tax_payer's id numbers
  #             @pods => pods
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

  def scrape_data(pod); end
end
