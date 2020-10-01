# frozen_string_literal: true

class Activity < ApplicationRecord
  validates :habit, presence: true, length: { minimum: 5, maximum: 40 }
  validates_uniqueness_of :habit, scope: :user_id, case_insensitive: true
  validates_associated :user

  belongs_to :user
  has_many :logs, dependent: :destroy
end
