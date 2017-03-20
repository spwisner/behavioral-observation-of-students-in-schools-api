class RemoveAetFromSessions < ActiveRecord::Migration[5.0]
  def change
    remove_column :sessions, :aet, :boolean
  end
end
