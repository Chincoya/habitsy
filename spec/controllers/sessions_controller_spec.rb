# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  include Devise::Test::IntegrationHelpers

  describe 'GET #new' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      get :new
    end

    it { should respond_with(200) }

    it { should render_template('new') }
  end

  describe 'POST #create' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @user = attributes_for(:user)
      create(:user, **@user)
    end

    it do
      should permit(:email, :password).for(:create, params: { user: { email: 'mail@example.com', password: 'password' } })
    end

    it 'with valid user' do
      post :create, params: { user: { email: @user[:email], password: @user[:password] } }
      should redirect_to(:root)
      should set_session
      should set_flash
    end

    it 'with valid user and invalid data' do
      post :create, params: { user: { email: @user[:email], password: '' } }
      should render_template(:new)
    end
  end
end
