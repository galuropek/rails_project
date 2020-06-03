class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @crew = Crew.find(params[:crew_id])
    puts 'hello'
  end

  def create
    @crew = Crew.find(params[:crew_id])
    @event = @crew.events.create(event_params)

    redirect_to crew_path(@crew)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start, :end, :user_id)
  end

  def prepare_date(e_params, field)
    e_params[field] = Date.parse(e_params[field])
  end
end
