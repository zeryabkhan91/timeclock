class WorkersController < ApplicationController
  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      redirect_to root_path, notice: "Profile Created Successfully ID: #{@worker.identifier}"
    else
      render :new, error: @worker.errors.full_messages.to_sentence
    end
  end

  def confirm_worker
    token = params[:token]
    if token.present?
      worker = Worker.find_by_identifier(token)
      if worker&.id?
        render json: {id: worker.id}
      else 
        render json: {
          errors: {
            full_messages: "Worker token is invalid"
          },
          type: "error"
        }, status: :unprocessable_entity
      end
    end

  end

  private

  def worker_params
    params.require(:worker).permit(:name, :date_of_birth)
  end
end
