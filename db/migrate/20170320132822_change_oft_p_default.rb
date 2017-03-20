class ChangeOftPDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :observations, :oft_p, :boolean, default: false
  end
end
