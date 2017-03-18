class RemovePetFromObservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :observations, :pet, :integer
  end
end
