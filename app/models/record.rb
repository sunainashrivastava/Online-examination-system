# frozen_string_literal: true

# class Record
class Record < ApplicationRecord
  belongs_to :user
  belongs_to :take_test
end
