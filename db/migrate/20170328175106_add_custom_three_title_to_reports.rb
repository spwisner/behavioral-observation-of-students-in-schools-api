class AddCustomThreeTitleToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :custom_three_title, :string
  end
end
