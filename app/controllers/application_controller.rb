# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ActionView::RecordIdentifier
  protect_from_forgery with: :exception
end
