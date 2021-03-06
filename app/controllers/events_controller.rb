class EventsController < ApplicationController
  load_and_authorize_resource :event
  load_and_authorize_resource :game

  # GET /events
  # GET /events.json
  def index
    @events = Event.in_future

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @event.game = Game.new
    @projects = Project.all
    @project_formats = ProjectFormat.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @projects = Project.all
    @project_formats = ProjectFormat.all
  end

  # POST /events
  # POST /events.json
  def create
    @event.author = current_user
    @event.event_type = "Game"
    @event.game.event = @event

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_path }
      format.json { head :ok }
    end
  end

  def invite_all
    @event.invite_all
    respond_to do |format|
      format.html { redirect_to events_path }
      format.js   { head :ok }
    end

  end

end

