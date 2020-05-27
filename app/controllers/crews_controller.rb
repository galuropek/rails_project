# frozen_string_literal: true
class CrewsController < ApplicationController

  def index
    @crews = Crew.all
  end

  def new

  end

  def show
    @crew = Crew.find(params[:id])
  end

  def create
    # render plain: params[:crew].inspect
    params[:crew][:owner] = current_user.id
    @crew = Crew.new(crew_params)

    @crew.save
    redirect_to @crew
  end

  private

  def crew_params
    params.require(:crew).permit(:name, :description)
  end
end
