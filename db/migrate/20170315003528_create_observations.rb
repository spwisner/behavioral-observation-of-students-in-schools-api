class CreateObservations < ActiveRecord::Migration[5.0]
  def change
    create_table :observations do |t|
      t.boolean :aet
      t.boolean :pet
      t.boolean :oft_m
      t.boolean :oft_v
      t.boolean :oft_p
      t.string :obs_comment
      t.integer :obs_num

      t.timestamps
    end
  end
end
