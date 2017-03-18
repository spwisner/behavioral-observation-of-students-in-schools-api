class RemoveAetFromObservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :observations, :aet, :integer
  end
end
