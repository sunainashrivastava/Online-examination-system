# frozen_string_literal: true

class TakeTestUser < ApplicationRecord
  belongs_to :user
  belongs_to :take_test
  validates :user_id, :take_test_id, :question_id, presence: true
end
