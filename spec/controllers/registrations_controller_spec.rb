# frozen_string_literal: true

require 'rails_helper'

RSpec.configure { |c| c.before { expect(controller).not_to be_nil } }

RSpec.describe Users::RegistrationsController, type: :controller do
  include Devise::Test::IntegrationHelpers

  describe 'GET #new' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      get :new
    end

    it { should respond_with(200) }

    it { should render_template('new') }
  end

  describe 'POST registrations#new' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @user = build(:user)
    end

    it do
      post(:create, params: user: @user)
      should redirect_to(static_pages_home_path)
    end
  end
end
