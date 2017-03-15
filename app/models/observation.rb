# frozen_string_literal: true

class Observation < ApplicationRecord
  belongs_to :user
  # belongs_to :student, inverse_of: :observations
  belongs_to :student
  belongs_to :session
  validates_presence_of :aet, :pet, :oft_m, :oft_v, :oft_p, :obs_num
end
