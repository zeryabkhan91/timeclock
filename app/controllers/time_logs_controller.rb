class TimeLogsController < ApplicationController
  def new
    @time_log = TimeLog.new
  end

  def create
    @time_log = TimeLog.new(time_log_params)
    @time_log.save
  end

  private

  def time_log_params
    params.require(:time_log).permit(:worker_id, :start_time, :end_time)
  end
end
