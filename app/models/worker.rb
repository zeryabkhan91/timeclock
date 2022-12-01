class Worker < ApplicationRecord

  before_create :generate_token


  private

  def generate_token
    self.identifier = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Worker.exists?(identifier: random_token)
    end
  end
end
