class AddUserToObservations < ActiveRecord::Migration[5.0]
  def change
    add_reference :observations, :user, foreign_key: true, index: true, null: false
  end
end
