class RemoveOftPFromObservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :observations, :oft_p, :integer
  end
end
