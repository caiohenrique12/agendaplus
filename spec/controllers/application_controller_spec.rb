# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe 'after sign in' do
    let(:user) { create(:user) }

    it 'redirects to the correct path' do
      sign_in user

      get :index

      expect(response).to redirect_to contacts_url
    end
  end
end
