class AddStudentRefToReports < ActiveRecord::Migration[5.0]
  def change
    add_reference :reports, :student, foreign_key: true
  end
end
