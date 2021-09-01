# frozen_string_literal: true

module ApplicationHelper
  FULLCELL = 'показать данные'
  EMPTYCELL = 'получить данные'
  # Attributes: @page_nav.pod_ids => tpi_numbers_on_page
  #               (array of scrapped tax_payer's id numbers).
  def elem_retrieval(tpi_numbers_on_page)
    pods = Pod.all
    return Array.new(PageNav::RECORDS_PER_PAGE_ON_TARGETED_SITE) { EMPTYCELL } if pods.blank?

    pods_check(pods, tpi_numbers_on_page)
  end

  private

  def pods_check(pods, tpi_numbers_on_page)
    tpi_numbers_on_page.reduce([]) do |el, pod|
      el << (pods.where(tax_payer_id: pod).blank? ? EMPTYCELL : FULLCELL)
    end
  end
end
