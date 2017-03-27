# frozen_string_literal: true

class Session < ApplicationRecord
  belongs_to :user
  belongs_to :student
  has_many :observations, dependent: :destroy
  has_one :report
  validates :int_num, :inclusion => 1..60
  validates :obs_time, :inclusion => 5..30
  validates :obs_setting, :obs_task,
            :obs_time, :int_num, presence: true
end
