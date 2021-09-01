# frozen_string_literal: true

# == Route Map
#
# data_new    GET    /data/new(.:format)               data#new

require 'rails_helper'

# Commented lines are remnants from controller to request spec transformation
RSpec.describe 'Data', type: :request do
  describe 'GET #new' do
    it 'returns http success' do
      # get :new
      get data_new_url
      expect(response).to have_http_status(:success)
    end
  end
end
