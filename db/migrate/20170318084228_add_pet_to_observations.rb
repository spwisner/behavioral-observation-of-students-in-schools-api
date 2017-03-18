class AddPetToObservations < ActiveRecord::Migration[5.0]
  def change
    add_column :observations, :pet, :boolean
  end
end
