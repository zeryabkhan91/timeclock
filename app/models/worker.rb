class Worker < ApplicationRecord

  before_create :generate_token
  
  has_many :time_logs, class_name: 'TimeLog', foreign_key: 'worker_id'

  private

  def generate_token
    self.identifier = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Worker.exists?(identifier: random_token)
    end
  end
end
