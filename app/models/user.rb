# frozen_string_literal: true
class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :students
  has_many :sessions
  has_many :reports
  has_many :observations
end
