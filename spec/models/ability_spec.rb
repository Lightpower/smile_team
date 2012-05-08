require 'spec_helper'
require "cancan/matchers"

describe Ability do

  context "user#index" do
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
    it "can read users" do
      @ability = Ability.new(@users[:admin])
      @ability.should be_able_to(:read, User)
    end
    it "cannot read users" do
      @ability = Ability.new(@users[:guest])
      @ability.should_not be_able_to(:read, User)
      @ability = Ability.new(@users[:mate])
      @ability.should_not be_able_to(:read, User)
      @ability = Ability.new(@users[:leader])
      @ability.should_not be_able_to(:read, User)
      @ability = Ability.new(@users[:captain])
      @ability.should_not be_able_to(:read, User)
    end
  end

end