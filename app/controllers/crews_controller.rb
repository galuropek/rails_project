# frozen_string_literal: true
class CrewsController < ApplicationController

  def index
    @crews = Crew.all
  end
end
