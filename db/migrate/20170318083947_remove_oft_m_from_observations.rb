class RemoveOftMFromObservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :observations, :oft_m, :integer
  end
end
