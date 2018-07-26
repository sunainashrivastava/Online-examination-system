# frozen_string_literal: true

class CreateTakeTests < ActiveRecord::Migration[5.2]
  def change
    create_table :take_tests do |t|
      t.string :type
      t.integer :sno
      t.string :question
      t.string :op1
      t.string :op2
      t.string :op3
      t.string :op4
      t.string :ans

      t.timestamps
    end
  end
end
