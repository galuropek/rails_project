class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all
  end

  def new
    @crew = Crew.find(params[:crew_id])
  end

  def create
    @crew = Crew.find(params[:crew_id])
    @event = @crew.events.create(event_params)

    redirect_to crew_path(@crew)
  end

  def show
    @event = Event.find(params[:crew_id])
  end

  def edit
    @event = Event.find(params[:crew_id])

    # render 'show' unless current_user_is_owner?(@crew)
  end

  def update
    @crew = Crew.find(params[:id])
    @event = Event.find(params[:crew_id])

    if @event.update(event_params)
      redirect_to crew_event_path(@event)
    else
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start, :end, :user_id)
  end
end
