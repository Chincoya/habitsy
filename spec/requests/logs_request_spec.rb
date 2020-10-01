# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Logs', type: :request do
  include Devise::Test::IntegrationHelpers
  before(:all) { @user = attributes_for(:user) }
  describe 'GET #index' do
    it 'has no authentication' do
      get logs_path
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'has authetication' do
      post user_registration_path, params: { user: @user }
      get logs_path
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'has no auth' do
      get new_log_path
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'has auth but no activity' do
      post user_registration_path, params: { user: @user }
      get new_log_path
      expect(response).to redirect_to(new_activity_path)
    end
  end

  describe 'POST #create' do
    it 'has no auth' do
      post logs_path, params: { log: { habit: 'coding', hours: 1, minutes: 1 } }
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'has auth and valid params' do
      post user_registration_path, params: { user: @user }
      post activities_path, params: { activity: { habit: 'Coding' } }
      expect { post logs_path, params: { log: { habit: 'Coding', hours: 1, minutes: 1 } } }
        .to change { Log.where('user_id = ?', User.last.id).count }.by(1)
      expect(response).to redirect_to(logs_path)
      expect(flash[:success]).not_to be_nil
    end

    it 'has auth but invalid params' do
      post user_registration_path, params: { user: @user }
      post activities_path, params: { activity: { habit: 'Coding' } }
      expect { post logs_path, params: { log: { habit: 'Coding', hours: -1, minutes: -1 } } }
        .to_not(change { Log.where('user_id = ?', User.last.id).count })
      expect(response).to redirect_to(:new_log)
      expect(flash[:alert]).to include('Error creating Log :c')
    end
  end
end
