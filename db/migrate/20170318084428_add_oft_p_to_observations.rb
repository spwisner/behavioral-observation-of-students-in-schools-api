class AddOftPToObservations < ActiveRecord::Migration[5.0]
  def change
    add_column :observations, :oft_p, :boolean
  end
end
