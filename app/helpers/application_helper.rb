# frozen_string_literal: true

module ApplicationHelper
  # Attributes: @page_nav.pod_ids => tax_payer_id_numbers_on_page,
  #               array of scrapped tax_payer's id numbers
  def elem_retrieval(tax_payer_id_numbers_on_page)
    elements = []
    tax_payer_id_numbers_on_page.each do |pod|
      elements << if Pod.all.where(tax_payer_id: pod).blank?
                    'получить данные'
                  else
                    'показать данные'
                  end
    end
    elements
  end
end
