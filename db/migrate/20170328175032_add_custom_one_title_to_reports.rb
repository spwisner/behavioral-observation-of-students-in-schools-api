class AddCustomOneTitleToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :custom_one_title, :string
  end
end
