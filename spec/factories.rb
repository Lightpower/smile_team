require 'factory_girl'

FactoryGirl.define do

  factory :user do
    email 'john@ukr.net'
    role 'guest'
  end


end
