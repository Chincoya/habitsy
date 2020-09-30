# frozen_string_literal: true

require 'rails_helper'

# RSpec.configure { |c| c.before { expect(controller).not_to be_nil } }

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
    end

    it do
      should permit(:name, :email, :password, :password_confirmation)
        .for(:create, params: { user: attributes_for(:user) })
    end

    it 'has invalid params' do
      expect { post :create, params: { user: attributes_for(:user, password: 'pass') } }.not_to change(User, :count)
      should route(:get, '/register/signup').to(action: :new)
    end

    it 'has valid params' do
      expect { post :create, params: { user: attributes_for(:user) } }.to change(User, :count).by(1)
      should redirect_to(:root)
      should set_session
      should set_flash
    end
  end

  describe 'GET registrations#edit' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @user = build(:user)
      @user.save
    end

    it do
      get :edit
      should redirect_to(new_user_session_path)
    end
  end
end
