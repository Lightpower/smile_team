require 'spec_helper'
require "cancan/matchers"

describe Ability do

  context "User" do
    before :all do
      @users = { guest:   FactoryGirl.create(:guest_user),
                 mate:    FactoryGirl.create(:mate_user),
                 leader:  FactoryGirl.create(:leader_user),
                 captain: FactoryGirl.create(:captain_user),
                 admin:   FactoryGirl.create(:admin_user)      }
    end
    after :all do
      User.delete_all
    end
    it "is for admin" do
      @ability = Ability.new(@users[:admin])
      @ability.should be_able_to(:read, User)
      @ability.should be_able_to(:manage, User)
    end
    it "guest" do
      @ability = Ability.new(@users[:guest])
      @ability.should_not be_able_to(:read, User)
      @ability.should_not be_able_to(:manage, User)
    end
    it "mate" do
      @ability = Ability.new(@users[:mate])
      @ability.should be_able_to(:read, User)
      @users.each do |user|
        if user == @users[:mate]
          @ability.should be_able_to(:manage, user)
        else
          @ability.should_not be_able_to(:manage, user)
        end
      end
    end
    it "leader" do
      @ability = Ability.new(@users[:leader])
      @ability.should be_able_to(:read, User)
      @ability.should be_able_to(:read, User)
      @users.each do |user|
        if user == @users[:mate]
          @ability.should be_able_to(:manage, user)
        else
          @ability.should_not be_able_to(:manage, user)
        end
      end
    end
    it "captain" do
      @ability = Ability.new(@users[:captain])
      @ability.should be_able_to(:read, User)
      @users.each do |user|
        if user == @users[:mate]
          @ability.should be_able_to(:manage, user)
        else
          @ability.should_not be_able_to(:manage, user)
        end
      end
    end
  end

  context "Events" do
    pending
  end

  context "Games" do
    pending
  end

  context "Invites" do
    pending
  end

  context "Team joining" do
    pending
  end

end