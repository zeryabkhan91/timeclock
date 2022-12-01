class Worker < ApplicationRecord

  before_create :generate_token
  
  has_many :time_logs

  enum :status, [:active, :inactive]

  def logged_time(start_date = nil, end_date = nil)
    logs = self.time_logs
    logs = logs.where('start_time > ?', start_date.beginning_of_day) if start_date.present?
    logs = logs.where('end_time <= ?', end_date.end_of_day) if end_date.present?
    seconds_to_hms(logs.pluck(:total_time).sum)
  end

  private

  def generate_token
    self.identifier = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Worker.exists?(identifier: random_token)
    end
  end

  def seconds_to_hms(sec)
    "%02d:%02d:%02d" % [sec / 3600, sec / 60 % 60, sec % 60]
  end
end
