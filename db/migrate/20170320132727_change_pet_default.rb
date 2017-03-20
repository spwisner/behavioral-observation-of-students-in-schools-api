class ChangePetDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :observations, :pet, :boolean, default: false
  end
end
