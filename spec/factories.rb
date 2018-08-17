# frozen_string_literal: true

# require 'faker'
FactoryBot.define do
  factory :user do
    username 'Joe12'
    email 'joe12@gmail.com'
    password 'blahblah1'
    firstname 'joe12'
    lastname 'jonas12'
  end
end
