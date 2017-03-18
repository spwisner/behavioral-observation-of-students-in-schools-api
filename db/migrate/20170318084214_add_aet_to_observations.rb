class AddAetToObservations < ActiveRecord::Migration[5.0]
  def change
    add_column :observations, :aet, :boolean
  end
end
