class AddOftVToObservations < ActiveRecord::Migration[5.0]
  def change
    add_column :observations, :oft_v, :boolean
  end
end
