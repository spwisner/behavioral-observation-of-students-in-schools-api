class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :presenting_issue
      t.string :class_behav_assess
      t.string :r_setting
      t.string :r_aet
      t.string :r_pet
      t.string :r_oftm
      t.string :r_oftv
      t.string :r_oftp
      t.string :r_finding
      t.string :r_customone
      t.string :r_customtwo
      t.string :r_customthree
      t.string :r_recommendation
      t.string :counselor_name

      t.timestamps
    end
  end
end
