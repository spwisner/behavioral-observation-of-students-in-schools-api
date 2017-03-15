class AddStudentToObservations < ActiveRecord::Migration[5.0]
  def change
    add_reference :observations, :student, foreign_key: true
  end
end
