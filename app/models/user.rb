# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze

  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX }
  validates_uniqueness_of :email, case_insensitive: true
  validates :password, presence: true, length: { minimum: 6, maximum: 24 }, on: :create
  validates :name, presence: true, length: { minimum: 5, maximum: 50 }

  has_many :logs, dependent: :destroy
  has_many :activities, dependent: :destroy

  def create_log_from_hash(params)
    activity = activities.where('habit = ?', params[:habit]).first
    return false unless activity

    logs.create(habit: params[:habit],
                time: (params[:hours].to_i * 60) + params[:minutes].to_i,
                activity_id: activity.id)
  end
end
