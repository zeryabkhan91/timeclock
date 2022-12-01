class TimeLogsController < ApplicationController
  def new
    @time_log = TimeLog.new
  end
  
  def create
  end

  private

  def time_log_params
    params.require(:TimeLog).permit(:worker_id, :start_time, :end_time, :total_time)
  end
end
