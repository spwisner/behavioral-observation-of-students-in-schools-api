# frozen_string_literal: true

class Session < ApplicationRecord
  belongs_to :user
  belongs_to :student, inverse_of: :sessions
  has_many :observations, dependent: :destroy
  validates :obs_on, :obs_setting, :obs_task,
            :obs_time, :int_num, presence: true
end
