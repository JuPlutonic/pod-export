# frozen_string_literal: true

class PodsController < ApplicationController
  before_action :set_pod, only: %i[show edit update]

  def index
    @pods = Pod.all # TODO: Filter '' also need to be passed by default

    # page navigation restarts this:
    @elements = []
    scrape
    @pod_ids.each_with_index do |pod, num|
      @elements << if @pods[num].try(:id) == pod
                     'показать данные'
                   else
                     'получить данные'
                   end
    end
  end

  def create
    @pod = Pod.new(pod_params)
    # respond_to |format|
    #   if @pod.save
    #     format.html { redirect_to '/' }
    #     # File create.js.erb:
    #     format.js
    #     format.json { render json: { pod_id: @pod.id, pod_organization: @pod.organization } }
    #   else
    #     format.html { render '/' }
    #     format.js
    #     format.json { render json: @pod.errors.full_messages, status: :unprocessable_entity }
    #   end
    # end
    if @pod.save
      format.html { redirect_to @pod }
    else
      redirect_to '/'
    end
  end

  def new
    @pod = Pod.new
    @current_id = params[:current_id]
    @current_organization = params[:current_organization]
  end

  def show
    @current_id = params[:current_id]
  end

  def edit; end

  def update; end

  private

  def set_pod
    @pod = Pod.find(params[:id])
  end

  def pod_params
    params.require(:pod).permit(:organization, :id)
  end

  # #rubocop:disable Metrics/AbcSize
  def scrape(cur_page = 0)
    require 'open-uri'

    base_url = 'https://data.gov.ru/organizations'
    doc = Nokogiri::HTML(URI.parse(base_url).open, nil, 'UTF-8')
    @pod_organizations = []
    @pod_ids = []

    # If we start browsing base_url, li[12] will be the last paginated table
    @cur_page = cur_page || @cur_page || 0
    if @cur_page.zero? && @last_page.nil?
      @last_page = doc
                   .xpath('//div[3]/ul/li[12]/a')
                   .to_s
                   .gsub(/^.*=/, '') # remove unuseful parts of url query
                   .gsub(/\D/, '').to_i # remove non digit parts of html tags
    end

    doc = doc.xpath('//tbody')
    doc.xpath('//td[2]/a').each do |anchor|
      @pod_organizations << anchor.text

      # gsub do deletion of /organization/ - it remains only taxpayer's id
      @pod_ids << anchor.xpath('@href').to_s.gsub(%r{(/\w+/)(\d+)}, '\2')
    end
  end
  # #rubocop:enable Metrics/AbcSize
end
