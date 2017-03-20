# frozen_string_literal: true

class Observation < ApplicationRecord
  belongs_to :user
  belongs_to :student
  belongs_to :session
  validates :aet, :pet, :oft_m, :oft_v, :oft_p, inclusion: { in: [true, false] }
end
