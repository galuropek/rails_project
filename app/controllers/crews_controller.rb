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

    if @crew.save
      redirect_to @crew
    else
      render 'new'
    end
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
