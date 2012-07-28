require 'spec_helper'

describe UsersController do

  context "index" do
    before :each do
      authenticate_user(:admin_user)
      get :index
    end

    it "success" do

      response.should be_success
    end
  end

  context "show" do
    before :each do
      authenticate_user(:admin_user)
      user = FactoryGirl.create(:guest_user)
      get :show, id: user.id
    end

    it "success" do
      response.should be_success
    end
  end

  context "new" do
    before :each do
      authenticate_user(:admin_user)
      get :new
    end

    it "success" do
      response.should be_success
    end
  end

  context "edit" do
    before :each do
      authenticate_user(:admin_user)
      user = FactoryGirl.create(:guest_user)
      get :edit, id: user.id
    end

    it "success" do
      response.should be_success
    end
  end

  context "create" do
    before :each do
      authenticate_user(:admin_user)
      params = {email: "email@example.ua", password: "123456", password_confirmation: "123456"}
      post :create, params: params
    end

    it "success" do
      response.should be_success
    end
  end

  context "update" do
    before :each do
      authenticate_user(:admin_user)
      @user = FactoryGirl.create(:guest_user)
    end

    it "success" do
      User.where(id: @user.id).size.should == 1
      params = {id: @user.id, email: "email@example.ua", site_role: "mate", password: "123456", password_confirmation: "123456"}
      put :update, params
    end
  end

  context "destroy" do
    before :each do
      authenticate_user(:admin_user)
      @user = FactoryGirl.create(:guest_user)
    end

    it "success" do
      User.where(id: @user.id).size.should == 1
      delete :destroy, id: @user.id
      User.where(id: @user.id).size.should == 0
    end
  end
end