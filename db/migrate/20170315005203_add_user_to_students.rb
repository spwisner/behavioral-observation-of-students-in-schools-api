# frozen_string_literal: true

class AddUserToStudents < ActiveRecord::Migration[5.0]
  def change
    add_reference :students, :user, foreign_key: true, index: true, null: false
  end
end
