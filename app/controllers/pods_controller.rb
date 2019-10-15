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

  def new
    @pod = Pod.new
  end

  def show
    @pod = Pod.find(params[:id])
  end

  private

  def scrape
    require 'open-uri'

    base_url = 'https://data.gov.ru/organizations'
    doc = Nokogiri::HTML(URI.parse(base_url).open, nil, 'UTF-8')
    @pod_names = []
    @pod_ids = []

    doc = doc.xpath('//tbody')
    doc.xpath('//td[2]/a').each do |anchor|
      @pod_names << anchor.text

      # gsub do deletion of /organization/ - it remains only taxpayer's id
      @pod_ids << anchor.xpath('@href').to_s.gsub(%r{(/\w+/)(\d+)}, '\2')
    end
  end
end
