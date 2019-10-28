# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PageNavsController, type: :controller do
  describe 'GET #create' do
    it 'returns http success' do
      get :create, xhr: true, params: { page_nav: { page: 0 } }
      expect(response).to render_template('page_navs/create')
      expect(response).to have_http_status(:success)
    end
  end
end
