require 'factory_girl'

FactoryGirl.define do

  sequence :email do |n|
    "email.#{n}@example.com"
  end

  sequence :title do |n|
    "title #{n}"
  end

  sequence :number do |n|
    n
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

  factory :project do
    name  { FactoryGirl.generate(:title) }
  end

  factory :project_format do
    name     { FactoryGirl.generate(:title) }
    project  { FactoryGirl.create(:project) }
  end

  factory :event do
    name       { FactoryGirl.generate(:title) }
    desc       "Event description"
    event_type "Game"
    start_date { DateTime.now }
    author     { FactoryGirl.create(:admin_user) }
  end

  factory :game do
    event          { FactoryGirl.create(:event) }
    project_format { FactoryGirl.create(:project_format) }
    number         { FactoryGirl.generate(:number) }
  end


end
