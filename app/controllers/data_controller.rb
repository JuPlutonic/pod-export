# frozen_string_literal: true

class DataController < ApplicationController
  # Use delegate!
  def new
    @datum.gov_code = Pods.where(tax_payer_id: params[:tax_payer_id].to_s).pod_code
    # @datum.date   = @date
    # @datum.source = @source
    # @datum.author = @author
    # @datum.converted = @converted
    short_name ||= @short_name
    kind  ||= @kind
    site ||= @site
    dataset_url ||= @dataset_url
    oktmo       ||= @oktmo
    params
      .require(:datum)
      .permit(:gov_code, pod: %i[short_name kind site dataset_url oktmo])
    # , attributes: %i[id date source author converted]
  end

  # ------@datum in Pods/new & Pods/show views----------------------------------
  # def build(tax_payer_id = nil)
  #   super

  #   return unless tax_payer_id

  #   pod = Pod.find(:tax_payer_id)
  # ||--|| - def new
end
