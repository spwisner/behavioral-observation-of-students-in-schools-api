# frozen_string_literal: true

class Student < ApplicationRecord
  belongs_to :user
  has_many :settings, dependent: :destroy
  validates :first_name, :last_name, :born_on,
            :school, :teacher, :grade, presence: true
end
