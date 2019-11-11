class SchedulesController < ApplicationController
  def index
    schedule = ScheduleService.new.schedule
    render json: { blah: 'hi', schedule: schedule }
  end

  private
end
