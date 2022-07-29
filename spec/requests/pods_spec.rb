# frozen_string_literal: true

# == Route Map
#
# pods_index GET    /pods/index(.:format)              pods#index
#       root GET    /                                  pods#index
#       pods GET    /pods(.:format)                    pods#index
#            POST   /pods(.:format)                    pods#create
#    new_pod GET    /pods/new(.:format)                pods#new
#   edit_pod GET    /pods/:tax_payer_id/edit(.:format) pods#edit
#        pod GET    /pods/:tax_payer_id(.:format)      pods#show
#            PATCH  /pods/:tax_payer_id(.:format)      pods#update
#            PUT    /pods/:tax_payer_id(.:format)      pods#update
#            DELETE /pods/:tax_payer_id(.:format)      pods#destroy

require 'rails_helper'

# Commented lines are remnants from controller to request spec transformation
RSpec.describe 'Pods', type: :request do
  let(:pod) { create(:pod_description) }

  describe 'GET #index' do
    it 'renders index template' do
      # get :index
      get pods_url
      expect(response).to render_template('pods/index')
    end
    # M.b. add `it` with `expect(response).to have_http_status(:success)`?
  end

  describe 'GET #show' do
    it 'loads pod' do
      # get :show, params: { tax_payer_id: pod.tax_payer_id }
      get pod_path(tax_payer_id: pod.tax_payer_id)
      expect(assigns(:pod)).to eq pod
    end
  end

  describe 'GET #new' do
    # before { get :new }
    before { get new_pod_url }

    it 'assigns new pod' do
      expect(assigns(:pod)).to be_a_new(Pod)
    end

    it 'renders new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'when attributes are valid' do
      # post :create, params: { pod: attributes_for(:pod_description) }

      it 'saves new pod in DB' do
        expect do
          post pods_path(pod: attributes_for(:pod_description))
        end.to change(Pod, :count).by(1)
      end

      it 'redirects to show' do
        post pods_path(pod: attributes_for(:pod_description))
        expect(response).to render_template(:show)
        # expect(response).to redirect_to pod_path(assigns(:pod))
      end
    end

    context 'when invalid' do
      # post :create, params: { pod: attributes_for(:invalid_pod) }

      xit 'does not save new pod in DB' do
        expect do
          post pods_url, params: { pod: attributes_for(:invalid_pod) }
        end.not_to change(Pod, :count)
      end

      xit 'renders show template' do
        post pods_url, params: { pod: attributes_for(:invalid_pod) }
        expect(response).to render_template :new
      end
    end
  end
end
