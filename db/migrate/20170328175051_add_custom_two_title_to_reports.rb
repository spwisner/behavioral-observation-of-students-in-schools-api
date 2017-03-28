class AddCustomTwoTitleToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :custom_two_title, :string
  end
end
