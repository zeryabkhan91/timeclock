class TimeLog < ApplicationRecord
  belongs_to :worker

  before_create :calculate_total_time
  validates_presence_of :start_time, :end_time
  validate :end_time_after_time_date?

  private

  def calculate_total_time
    self.total_time = end_time - start_time
  end

  def end_time_after_time_date?
    return false if start_time.blank? || end_time.blank?

    if end_time < start_time
      errors.add :end_date, "must be after start date"
    end
  end
end
