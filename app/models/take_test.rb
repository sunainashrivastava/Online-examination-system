class TakeTest < ApplicationRecord
	has_many :records
	has_many :take_test_users
	has_many :users, through: :take_test_users
	scope :aptitudes, -> {where(type: 'Aptitude')}
	scope :reasonings, -> {where(type: 'Reasoning')}
	scope :verbals, -> {where(type: 'Verbal')}
	validates :sno, :question, :op1, :op2, :op3, :op4, :ans, presence: true
  
  has_many :pictures, as: :imageable

  accepts_nested_attributes_for :pictures
end
