# frozen_string_literal: true

class CreateTakeTestUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :take_test_users do |t|
      t.references :user, foreign_key: true
      t.references :take_test, foreign_key: true
      t.boolean :result
      t.integer :question_id

      t.timestamps
    end
  end
end
