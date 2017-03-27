# frozen_string_literal: true
class Report < ApplicationRecord
  belongs_to :user
  belongs_to :student
  belongs_to :session
  validates_uniqueness_of :session_id
  validates :presenting_issue, :class_behav_assess,
            :r_setting, :r_aet, :r_pet, :r_oftm, :r_oftv,
            :r_oftp, :r_finding, :r_customone,
            :r_customtwo, :r_customthree,
            :r_recommendation,
            :counselor_name, presence: true
end
