class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @event = Event.new
  end

  def create
   
    @event = Event.new(
      title:params[:title],
      description:params[:description],
      location:params[:location],
      price:params[:price],
      duration:params[:duration],
      start_date:params[:start_date],
      admin: current_user
      )
    #@event.admin = current_user

      if @event.save
        redirect_to event_path(@event.id)
      else
         render :new
      end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  def edit
    @event= Event.find(params[:id])
  end

  def update
    @event= Event.find(params[:id])
      if @event=Event.update(
        title: params[:title],
        price:params[:price],
        description:params[:description],
        admin_id:current_user.id,
        location: params[:location],
        start_date:params[:start_date],
        duration:params[:duration]
        )
      redirect_to event_path(@event.id)
		else
		  render edit
		end 
  end

  def destroy
    @event= Event.find(params[:id])
		@event.destroy
		redirect_to events_path
  end
end
