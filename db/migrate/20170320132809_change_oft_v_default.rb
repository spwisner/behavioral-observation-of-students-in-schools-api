class ChangeOftVDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :observations, :oft_v, :boolean, default: false
  end
end
