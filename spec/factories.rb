require 'factory_girl'

FactoryGirl.define do

  sequence :email do |n|
    "email.#{n}@example.com"
  end

  factory :user do
    email         { FactoryGirl.generate(:email) }
    password              '123456'
    password_confirmation '123456'

    factory :guest_user do
      site_role 'guest'
    end

    factory :mate_user do
      site_role 'mate'
    end

    factory :leader_user do
      site_role 'leader'
    end

    factory :captain_user do
      site_role 'captain'
    end

    factory :admin_user do
      site_role 'admin'
    end

  end


end
