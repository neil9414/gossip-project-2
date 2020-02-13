class AttendancesController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def index
    
    @event=Event.find(params[:event_id])
    @attendees=@event.users
    
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
