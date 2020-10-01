# frozen_string_literal: true

class Log < ApplicationRecord
  validates :habit, presence: true, length: { minimum: 5, maximum: 40 }
  validates :time, presence: true, numericality: {
    only_integer: true,
    greater_than: 0,
    less_than: 1440
  }
  validates_associated :user
  validates_associated :activity

  belongs_to :user
  belongs_to :activity
end
