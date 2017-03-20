class ChangeOftMDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :observations, :oft_m, :boolean, default: false
  end
end
