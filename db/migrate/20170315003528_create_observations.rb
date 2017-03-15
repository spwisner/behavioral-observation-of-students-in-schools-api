class CreateObservations < ActiveRecord::Migration[5.0]
  def change
    create_table :observations do |t|
      t.integer :aet
      t.integer :pet
      t.integer :oft_m
      t.integer :oft_v
      t.integer :oft_p
      t.string :obs_comment
      t.integer :obs_num

      t.timestamps
    end
  end
end
