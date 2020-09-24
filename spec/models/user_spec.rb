# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  context 'Valid Factory' do
    it 'has valid factory' do
      expect(build(:user).valid?).to be_truthy
    end
  end

  context 'Validations' do
    it 'is invalid without parameters' do
      user = build(:user, email: nil, password: nil)
      expect(user.valid?).to be_falsy
    end
  
    it 'is invalid without email' do
      user = build(:user, email: nil, password: 'password')
      expect(user.valid?).to be_falsy
    end
  
    it 'is invalid without password' do
      user = build(:user, email: Faker::Internet.email, password: nil)
      expect(user.valid?).to be_falsy
    end
  
    it 'is valid with correct parameters' do
      user = build(:user)
      expect(user.valid?).to be_truthy
    end
  
    it 'has unique email' do
      user1 = build(:user, email: 'example@example.com', password: 'password')
      user2 = build(:user, email: 'example@example.com', password: 'password')
      user1.save
  
      expect(user2.save).to be_falsy
    end
  end

  context 'Registrations' do
    before(:each) do
      @user = build(:user)
    end

    it 'can be registered' do
      @user.save

      expect(User.last).to eql(@user)
    end

    it 'can not be registered with existing email' do
      @user.save
      new_user = User.new({email: @user.email, password: 'password'})

      expect(new_user.save).to be_falsy
      expect(User.all.length).to eql(1)
    end
  end
  
end
