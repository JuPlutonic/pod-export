# frozen_string_literal: true

class PodsController < ApplicationController
  def index
    @pods = Pod.all # TODO: Filter '' also need to be passed by default
    elements = []
    @pods.each_with_index do |pod, num|
      elements << if pod.id == @pod_ids[num]
                    'show'
                  else
                    'view'
                  end
    end
  end
end
