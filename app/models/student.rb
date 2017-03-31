# frozen_string_literal: true

class Student < ApplicationRecord
  belongs_to :user
  has_many :sessions, dependent: :destroy
  has_many :reports, dependent: :destroy
  validates_presence_of :first_name, :last_name,
                        :grade
end
