# frozen_string_literal: true

# == Route Map
#
# page_nav    POST   /page_navs/:id/create(.:format)   page_navs#create
# page_navs   POST   /page_navs(.:format)              page_navs#create

require 'rails_helper'

# Commented lines are remnants from controller to request spec transformation
RSpec.describe 'PageNavs', type: :request do
  describe 'POST #create' do
    it 'responses with template rendering' do
      # get :create, xhr: true, params: { page_nav: { page: 0 } }
      post page_navs_url, xhr: true, params: { page_nav: { page: 0 } }
      expect(response).to render_template('page_navs/create')
    end

    it 'returns http success' do
      post page_navs_url, xhr: true, params: { page_nav: { page: 0 } }
      expect(response).to have_http_status(:success)
    end
  end
end
