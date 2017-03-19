# frozen_string_literal: true

class AddCompletedToSession < ActiveRecord::Migration[5.0]
  def change
    add_column :sessions, :completed, :boolean, default: false
  end
end
