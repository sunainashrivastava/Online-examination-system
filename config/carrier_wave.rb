require 'carrierwave/orm/activerecord'
require 'carrierwave'
CarrierWave.configure do |config|
 config.root = Rails.root
end