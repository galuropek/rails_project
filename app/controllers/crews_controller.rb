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
    @crew = current_user.crews.create(crew_params)
    redirect_to crew_path(@crew)
  end

  def edit
    @crew = Crew.find(params[:id])
  end

  def update
    @crew = Crew.find(params[:id])

    if @crew.update(crew_params)
      redirect_to @crew
    else
      render 'edit'
    end
  end

  def destroy
    @crew = Crew.find(params[:id])

    @crew.destroy
    redirect_to crews_path
  end

  private

  def crew_params
    params.require(:crew).permit(:name, :description)
  end
end
