# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity, type: :model do
  before(:all) do
    @user = build(:user)
    @user.save
  end

  context 'Factory' do
    it 'is a valid factory' do
      @activity = build(:activity, user: @user)
      puts "\n\n\nAAAA"
      puts @activity.errors.to_a
      puts "\n\n\nAAAA"
      expect(@activity.valid?).to be_truthy
    end
  end
end
