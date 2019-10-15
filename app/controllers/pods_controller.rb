# frozen_string_literal: true

class PodsController < ApplicationController
  def index
    @pods = Pod.all
    elements = []
    @pods.each_with_index do |pod, num|
      if pod.id == @pod_ids
        elements << "show"
      else
        elements << "view"
      end
    end
  end
end
