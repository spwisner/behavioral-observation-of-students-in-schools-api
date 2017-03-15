class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.date :obs_on
      t.string :obs_setting
      t.string :obs_task
      t.integer :obs_time
      t.integer :int_num

      t.timestamps
    end
  end
end
