class AddStudentToSessions < ActiveRecord::Migration[5.0]
  def change
    add_reference :sessions, :student, foreign_key: true
  end
end
