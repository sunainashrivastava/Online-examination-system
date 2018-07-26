# frozen_string_literal: true

class AddColumnToRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :attempt_time, :datetime
  end
end
