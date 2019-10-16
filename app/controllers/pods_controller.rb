# frozen_string_literal: true

class PodsController < ApplicationController
  def index
    @pods = Pod.all # TODO: Filter '' also need to be passed by default
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
      render 'new'
    end
  end

  def new
    @pod_id = params[:pod_id]
    @pod_organization = params[:pod_organization]
    @pod = Pod.new
  end

  def show
    @pod_id = params[:pod_id]
    @pod = Pod.find(params[:id])
  end

  private

  def pod_params
    params.require(:pod).permit(:organization, :id)
  end

  def scrape
    require 'open-uri'

    base_url = 'https://data.gov.ru/organizations'
    doc = Nokogiri::HTML(URI.parse(base_url).open, nil, 'UTF-8')
    @pod_organizations = []
    @pod_ids = []

    doc = doc.xpath('//tbody')
    doc.xpath('//td[2]/a').each do |anchor|
      @pod_organizations << anchor.text

      # gsub do deletion of /organization/ - it remains only taxpayer's id
      @pod_ids << anchor.xpath('@href').to_s.gsub(%r{(/\w+/)(\d+)}, '\2')
    end
  end
end
