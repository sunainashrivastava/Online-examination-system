# frozen_string_literal: true

class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.references :user, foreign_key: true
      t.references :take_test, foreign_key: true
      t.integer :scores

      t.timestamps
    end
  end
end
