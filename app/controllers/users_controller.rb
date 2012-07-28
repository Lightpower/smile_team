# coding: utf-8
class UsersController < ApplicationController
  load_and_authorize_resource :user

  # GET /users
  # GET /users.json
  def index
    @users = User.accessible_by(current_ability)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    # Only Admin and team captain can set user's team role
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    # Only Admin and team captain can change user's team role
    if cannot? :manage, :site_role
      params[:user].delete(:site_role)
    end
    if @user.password.blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end

  ##
  # AJAX method for approving user's request of joining the team
  #
  def approve_join_request
    authorize! :manage, :join_requests
    @user.site_role = "mate"
    respond_to do |format|
      if @user.save
        format.html { redirect_to join_requests_path, notice: "#{@user.show_name} принят в команду" }
        format.js { render json: { result: true }, status: 200 }
      else
        format.html { redirect_to join_requests_path, error: @user.errors.full_messages }
        format.js { render json: self.errors, status: 500 }
      end
    end
  end

  ##
  # AJAX method for rejecting user's request of joining the team
  #
  def reject_join_request
    authorize! :manage, :join_requests
    @user.group = nil
    respond_to do |format|
      if @user.save
        format.html { redirect_to join_requests_path, notice: "Запрос пользователя #{@user.show_name} отклонён" }
        format.js { render json: { result: true }, status: 200 }
      else
        format.html { redirect_to join_requests_path, error: @user.errors.full_messages }
        format.js { render json: @user.errors, status: 500 }
      end
    end
  end

end
