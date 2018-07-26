# frozen_string_literal: true

class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true, optional: true
  mount_uploader :avatar, AvatarUploader
end
