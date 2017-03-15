# frozen_string_literal: true

class AddStudentToObservations < ActiveRecord::Migration[5.0]
  def change
    add_reference :observations, :student, foreign_key: true, index: true, null: false
  end
end
