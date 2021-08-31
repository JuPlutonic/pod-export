# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pods, type: :request do
  let(:pod) { create(:pod_description) }

  describe 'GET #index' do
    it 'renders index template' do
      get :index
      expect(response).to render_template('pods/index')
    end
  end

  describe 'GET #show' do
    it 'loads pod' do
      get :show, params: { tax_payer_id: pod.tax_payer_id }
      expect(assigns(:pod)).to eq pod
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns new pod' do
      expect(assigns(:pod)).to be_a_new(Pod)
    end

    it 'renders new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'when valid' do
      it 'saves new pod in DB' do
        expect do
          post :create, params: { pod: attributes_for(:pod_description) }
        end.to change(Pod, :count).by(1)
      end

      it 'redirects to show' do
        post :create, params: { pod: attributes_for(:pod_description) }
        expect(response).to redirect_to pod_path(assigns(:pod))
      end
    end

    context 'when invalid' do
      xit 'does not save new pod in DB' do
        expect do
          post :create, params: { pod: attributes_for(:invalid_pod) }
        end.not_to change(Pod, :count)
      end

      xit 'renders show template' do
        post :create, params: { pod: attributes_for(:invalid_pod) }
        expect(response).to render_template :new
      end
    end
  end
end
