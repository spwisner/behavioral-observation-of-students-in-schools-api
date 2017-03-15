class AddSessionToObservations < ActiveRecord::Migration[5.0]
  def change
    add_reference :observations, :session, foreign_key: true, index: true, null: false
  end
end
