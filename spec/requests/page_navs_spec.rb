# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PageNavs, type: :request do
  describe 'GET #create' do
    it 'responses with template rendering' do
      get :create, xhr: true, params: { page_nav: { page: 0 } }
      expect(response).to render_template('page_navs/create')
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
