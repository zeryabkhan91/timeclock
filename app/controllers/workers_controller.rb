class WorkersController < ApplicationController
  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      redirect_to root_path, notice: "Profile Created Successfully ID: #{@worker.identifier}"
    else
    end
  end

  private

  def worker_params
    params.require(:worker).permit(:name, :date_of_birth)
  end
end
