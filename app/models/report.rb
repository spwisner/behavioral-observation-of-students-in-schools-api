# frozen_string_literal: true
class Report < ApplicationRecord
  belongs_to :user
  belongs_to :student
  belongs_to :session
  validates_uniqueness_of :session_id
  validates :counselor_name, presence: true
end
