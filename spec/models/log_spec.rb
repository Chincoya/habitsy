# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Log, type: :model do
  before(:all) do
    @user = build(:user)
    @user.save
  end

  context 'Factory' do
    it 'is a valid factory' do
      expect(build(:log, user: @user).valid?).to be_truthy
    end
  end

  context 'validation' do
    it 'is failed without parameters' do
      log = Log.new
      expect(log.valid?).to be_falsy
    end

    it 'is failed without user' do
      log = build(:log)
      expect(log.valid?).to be_falsy
    end

    it 'is failed without habit name' do
      log = build(:log, habit: nil, user: @user)
      expect(log.valid?).to be_falsy
    end

    it 'is failed without time' do
      log = build(:log, time: nil, user: @user)
      expect(log.valid?).to be_falsy
    end

    it 'is failed if time is negative' do
      log = build(:log, user: @user, time: -100)
      expect(log.valid?).to be_falsy
    end

    it 'is failed if time is greater than a day' do
      log = build(:log, user: @user, time: 1441)
      expect(log.valid?).to be_falsy
    end
  end
end
