# frozen_string_literal: true
class CrewsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @crews = Crew.all
  end

  def new; end

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

    render 'show' unless current_user_is_owner?(@crew)
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
    if current_user_is_owner?(@crew)
      @crew.destroy
      redirect_to crews_path
    else
      render 'show'
    end
  end

  private

  def crew_params
    params.require(:crew).permit(:name, :description)
  end

  def current_user_is_owner?(crew)
    current_user.id == crew.user_id
  end
end
