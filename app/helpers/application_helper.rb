# frozen_string_literal: true

module ApplicationHelper
  # Attributes: @page_nav.pod_ids => tax_payer_id_numbers_on_page,
  #               array of scrapped tax_payer's id numbers
  def elem_retrieval(tax_payer_id_numbers_on_page)
    elements = []
    pods = Pod.all

    tax_payer_id_numbers_on_page.each do |pod|
      return Array.new(20) { 'получить данные' } if pods.blank?

      elements << if pods.where(tax_payer_id: pod).blank?
                    'получить данные'
                  else
                    'показать данные'
                  end
    end
    elements
  end
end
