class SchedulesController < ApplicationController
  def index
    schedule = ScheduleService.new.schedule
    render json: schedule
  end

  private
end
