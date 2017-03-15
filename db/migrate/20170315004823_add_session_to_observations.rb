class AddSessionToObservations < ActiveRecord::Migration[5.0]
  def change
    add_reference :observations, :session, foreign_key: true
  end
end
