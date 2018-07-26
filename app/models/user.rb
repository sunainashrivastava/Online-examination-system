# frozen_string_literal: true

# user class
class User < ApplicationRecord
  rolify
  # resourcify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :records
  has_many :take_test_users
  has_many :take_tests, through: :take_test_users
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, uniqueness: true
  delegate :aptitudes, :reasonings, :verbals, to: :take_tests
  validates :password, format: { with: /(?=.*[a-z])(?=.*[\0-\9]).+/ }
  mount_uploader :avatar, AvatarUploader
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures
end
