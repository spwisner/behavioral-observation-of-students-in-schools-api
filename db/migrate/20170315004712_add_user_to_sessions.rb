class AddUserToSessions < ActiveRecord::Migration[5.0]
  def change
    add_reference :sessions, :user, foreign_key: true, index: true, null: false
  end
end
