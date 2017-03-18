class AddOftMToObservations < ActiveRecord::Migration[5.0]
  def change
    add_column :observations, :oft_m, :boolean
  end
end
