class DashboardController < ApplicationController
  def index
  end

  def manager_index
    @workers = Worker.order(:created_at)
  end
end
