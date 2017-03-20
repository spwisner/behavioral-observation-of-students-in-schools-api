class ChangeColumnDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :observations, :aet, :boolean, default: false
  end
end
